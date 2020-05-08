require File.expand_path(File.dirname(__FILE__) + "../../../../spec_helper")
# require "spec_helper"

describe ActiveRecord::Acts::ShoppingCart::Collection do
  let(:klass) do
    klass = Class.new
    klass.send(:include, ActiveRecord::Acts::ShoppingCart::Collection)
  end

  let(:subject) do
    subject = klass.new
    allow(subject).to receive(:shopping_cart_items).and_return([])
    subject
  end

  let(:object) { double }

  let(:shopping_cart_item) do
    instance_double("shopping_cart_item", quantity: 2, save: true)
  end

  describe :add do
    context "item is not on cart" do
      before do
        allow(subject).to receive(:item_for).with(object)
      end

      it "creates a new shopping cart item" do
        created_object = double
        expect(subject.shopping_cart_items).to receive(:create)
          .with(item: object, price: 19.99, quantity: 3)
          .and_return(created_object)
        item = subject.add(object, 19.99, 3)
        expect(item).to be created_object
      end
    end

    context "item is not in cart" do
      before do
        allow(subject).to receive(:item_for).with(object)
      end

      it "creates a new shopping cart item non-cumulatively" do
        expect(subject.shopping_cart_items).to receive(:create).with(item: object, price: 19.99, quantity: 3)
        subject.add(object, 19.99, 3, false)
      end
    end

    context "item is already on cart" do
      before do
        allow(subject).to receive(:item_for).with(object).and_return(shopping_cart_item)
      end

      it "updates the quantity for the item" do
        expect(shopping_cart_item).to receive(:quantity=).with(5)
        item = subject.add(object, 19.99, 3)
        expect(item).to be shopping_cart_item
      end
    end

    context "item is already in cart" do
      before do
        allow(subject).to receive(:item_for).with(object).and_return(shopping_cart_item)
      end

      it "updates the quantity for the item non-cumulatively" do
        expect(shopping_cart_item).to receive(:quantity=).with(3) # not 5
        subject.add(object, 19.99, 3, false)
      end
    end
  end

  describe :clear do
    before do
      expect(subject.shopping_cart_items).to receive(:clear)
    end

    it "clears all the items in the cart" do
      subject.clear
      expect(subject.no_items?).to be true
    end
  end

  describe "items?" do
    context "cart has items" do
      before do
        subject.shopping_cart_items << double
      end

      it "returns true" do
        expect(subject.items?).to be true
      end
    end

    context "cart is empty" do
      it "returns false" do
        expect(subject.items?).to be false
      end
    end
  end

  describe "no_items?" do
    context "cart has items" do
      before do
        subject.shopping_cart_items << double
      end

      it "returns false" do
        expect(subject.no_items?).to be false
      end
    end

    context "cart is empty" do
      it "returns true" do
        expect(subject.no_items?).to be true
      end
    end
  end

  describe :remove do
    context "item is not on cart" do
      before do
        allow(subject).to receive(:item_for).with(object)
      end

      it "does nothing" do
        subject.remove(object)
      end
    end

    context "item is on cart" do
      before do
        allow(subject).to receive(:item_for).with(object).and_return(shopping_cart_item)
      end

      context "remove less items than those on cart" do
        it "just updates the shopping cart item quantity" do
          expect(shopping_cart_item).to receive(:quantity=).with(1)
          subject.remove(object, 1)
        end
      end

      context "remove more items than those on cart" do
        it "removes the shopping cart item object completely" do
          expect(shopping_cart_item).to receive(:delete)
          subject.remove(object, 99)
        end
      end
    end
  end

  describe :subtotal do
    context "cart has no items" do
      before do
        allow(subject).to receive(:shopping_cart_items).and_return([])
      end

      it "returns 0" do
        expect(subject.subtotal).to be_an_instance_of(Money)
        expect(subject.subtotal).to eq(Money.new(0))
      end
    end

    context "cart has items" do
      before do
        items = [instance_double("item 1", quantity: 2, price: Money.new(3399)),
                 instance_double("item 2", quantity: 1, price: Money.new(4599))]
        allow(subject).to receive(:shopping_cart_items).and_return(items)
      end

      it "returns the sum of the price * quantity for all items" do
        expect(subject.subtotal).to be_an_instance_of(Money)
        expect(subject.subtotal).to eq(Money.new(11_397))
      end
    end
  end

  describe :shipping_cost do
    it "returns 0" do
      expect(subject.shipping_cost).to be_an_instance_of Money
      expect(subject.shipping_cost).to eq(Money.new(0))
    end
  end

  describe :taxes do
    context "subtotal is 100" do
      before do
        allow(subject).to receive(:subtotal).and_return(Money.new(10_000))
      end

      it "returns 8.25" do
        expect(subject.taxes).to be_an_instance_of Money
        expect(subject.taxes).to eq(Money.new(825))
      end
    end
  end

  describe :tax_pct do
    it "returns 8.25" do
      expect(subject.tax_pct).to eq(8.25)
    end
  end

  describe :total do
    before do
      allow(subject).to receive_messages(
        subtotal: Money.new(1099),
        taxes: Money.new(1399),
        shipping_cost: Money.new(1299)
      )
    end

    it "returns subtotal + taxes + shipping_cost" do
      expect(subject.total).to be_an_instance_of Money
      expect(subject.total).to eq(Money.new(3797))
    end
  end

  describe :total_unique_items do
    context "cart has no items" do
      it "returns 0" do
        expect(subject.total_unique_items).to eq(0)
      end
    end

    context "cart has some items" do
      before do
        items = [instance_double("item 1", quantity: 2, price: 33.99),
                 instance_double("item 2", quantity: 1, price: 45.99)]
        allow(subject).to receive(:shopping_cart_items).and_return(items)
      end

      it "returns the sum of the quantities of all shopping cart items" do
        expect(subject.total_unique_items).to eq(3)
      end
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + "../../../../spec_helper")

describe ActiveRecord::Acts::ShoppingCartItem::InstanceMethods do
  let(:klass) do
    klass = Class.new
    klass.send :include, ActiveRecord::Acts::ShoppingCartItem::InstanceMethods
    klass
  end

  let(:subject) do
    subject = klass.new
    allow(subject).to receive(:save).and_return(true)
    subject
  end

  describe :subtotal do
    it "returns the quantity * price" do
      allow(subject).to receive_messages(quantity: 2, price: 33.99)
      expect(subject.subtotal).to eq(67.98)
    end
  end

  describe :update_quantity do
    it "updates the item quantity" do
      expect(subject).to receive(:quantity=).with(5)
      expect(subject).to receive(:save)
      subject.update_quantity(5)
    end
  end

  describe :update_price do
    it "updates the item price" do
      expect(subject).to receive(:price=).with(55.99)
      expect(subject).to receive(:save)
      subject.update_price(55.99)
    end
  end
end

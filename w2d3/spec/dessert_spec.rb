require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:gelato) { Dessert.new("gelato", 12, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(gelato.type).to eq('gelato')
    end

    it "sets a quantity" do
      expect(gelato.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(gelato.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("gelato", "ALL THE GELATO", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      gelato.add_ingredient("strawberry")
      expect(gelato.ingredients).to include("strawberry")
    end
  end

  # describe "#mix!" do
  #   let(:previous_configuration) { gelato.ingredients }
  #   it "shuffles the ingredient array" do
  #     expect(gelato.mix!).to_not eq(previous_configuration)
  #   end
  # end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      gelato.eat(2)
      expect(gelato.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { gelato.eat(24) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Katarina the Great Baker")
      expect(gelato.serve).to include("Chef Katarina the Great Baker")
    end
  end

  # describe "#make_more" do
  #   it "calls bake on the dessert's chef with the dessert passed in" do
  #     allow(chef).to receive(:bake).with(self)
  #     gelato.make_more
  #     expect(chef).to_receive(:bake).with(self)
  #   end
  # end

end

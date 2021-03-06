require 'spec_helper'
require_relative '../lib/chess/bishop.rb'

describe Bishop do

  it { should be_a_kind_of(Piece) }
  it { should respond_to :color }
  it { should respond_to :location }

  it "should know what its character is" do
    @bishop = Bishop.new("White", "A1")
    expect(@bishop.icon).to eq("\u2657")
  end

  describe "valid moves" do
    before { @bishop = Bishop.new("white", "D4") }
    before { @board = Board.new }

    it "should not be able to move vertically to any position" do
      expect(@bishop.valid_move?("A3", @board)).to be_falsey
    end

    it "should not be able to move horizontally to any position" do
      expect(@bishop.valid_move?("D8", @board)).to be_falsey
    end

    it "should be able to move diagonally" do
      expect(@bishop.valid_move?("C3", @board)).to be_truthy
    end
  end

end

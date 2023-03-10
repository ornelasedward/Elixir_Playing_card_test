defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 24 cards" do
      deck_length = length(Cards.create_deck)
      assert deck_length == 24
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle_cards(deck)
  end

  #same as above but refute
  #test "shuffling a deck randomizes it" do
    #deck = Cards.create_deck
    #refute deck == Cards.shuffle_cards(deck)
  #end




end


defmodule Cards do

    def create_deck do
      ["Ace", "two", "three", "four", "five", "six"]
    end

    #shuffle method
    def shuffle_cards(deck) do
      Enum.shuffle(deck)
    end

    #enum member method
    def contains?(deck, card) do
      Enum.member?(deck, card)
    end


end

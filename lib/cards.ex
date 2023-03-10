
defmodule Cards do
    @module """
      Provides methods for creating and handling a deck of cards
    """

    @doc """
    Returns a list of strings representing a list of playing cards
    """
    def create_deck do
      values = ["Ace", "two", "three", "four", "five", "six"]
      suits = ["Spades", "Clubs", "Hearts", "Diamomds"]

      #cards = for value <- values do
      #       for suit <- suits do
      #
      #       "#{value} of #{suit}"
      # end
      # end

      # List.flatten(cards)

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end
    end



    #shuffle method
    def shuffle_cards(deck) do
      Enum.shuffle(deck)
    end

    @doc """
      Determines whether a deck contains a given card

      ## Examples:

          iex> deck = Cards.create_deck
          iex> Cards.contains?(deck, "Ace of Spades")
          true
    """
    #enum member method
    def contains?(deck, card) do
      Enum.member?(deck, card)
    end

    @doc """
      divides a deck into a hand and the remainder of the deck. The `hand size` is an argument that indicates how many cards should be in the hand.

      ##Examples

        iex.bat -S mix
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal_cards(deck, 1)
        iex> hand
        ["Ace of Spades"]
    """
    #split method
    def deal_cards(deck, hand_size) do
          Enum.split(deck, hand_size)
    end

    #save method
    def save(deck, filename) do
        binary = :erlang.term_to_binary(deck)
        File.write(filename, binary)
    end

    #load method
    #def load(filename) do
      #{status, binary} = File.read(filename)

      #case status do
        #If status exists write ok otherwise run error
        #:ok -> :erlang.binary_to_term binary
        #:error -> "That file does not exist"
      #end
    #end


    #load method condensed
    def load(filename) do
      case File.read(filename) do
        # If status exists write ok otherwise run error
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason} -> "That file does not exist"
      end
    end


    #Create hand and pass result to all methods in one go
    #def create_hand(hand_size) do
        #deck = Cards.create_deck
        #deck = Cards.shuffle_cards(deck)
       # hand = Cards.deal_cards(deck, hand_size)
   # end

      #Pipe operator function to condence file and automatically assign variable deck
    def create_hand(hand_size) do
        Cards.create_deck
        |> Cards.shuffle_cards
        |> Cards.deal_cards(hand_size)
    end
end

class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    suits = %w[Hearts Spades Diamonds Clubs]
    ranks = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    suits.each { |suit| ranks.each { |rank| @cards << "#{rank} of #{suit}" } }
  end

  def shuffle
    @cards.shuffle!
  end
  
  def cut
    @cards.rotate! @cards.count / 2
  end
  
  def draw
    @cards.shift
  end
end

class String
  include Comparable
  
  def <=> other
    self.value <=> other.value
  end

  def value
    rank = self.split.first
    case rank
    when 'Ace'
      14
    when 'King'
      13
    when 'Queen'
      12
    when 'Jack'
      11
    else
      rank.to_i
    end
  end
end
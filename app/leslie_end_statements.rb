class LeslieEnding
  @@endings = [
    "I love you.",
    "you are doing great.",
    "the world needs you.",
    "you butter my biscuit.",
    "you are smart as a whip."
  ]

  def self.ending
    @@endings.sample
  end
end

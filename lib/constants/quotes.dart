/// Centralized collection of love quotes for the app
/// Add your own personal quotes here
class LoveQuotes {
  // Anniversary and time-based quotes
  static const List<String> anniversaryQuotes = [
    "Some love stories only become more beautiful with time.",
    "Twenty-two years, countless memories, one beautiful journey.",
    "Years pass, memories grow, and love remains.",
    "A beautiful beginning became a beautiful forever.",
    "Two hearts, one journey, twenty beautiful years.",
  ];
  
  // Family and togetherness quotes
  static const List<String> familyQuotes = [
    "Home is not a place. It is the people we love.",
    "Every beautiful family begins with a beautiful story.",
    "The greatest gift parents can give is love for each other.",
    "Family is where life begins and love never ends.",
    "Together is a wonderful place to be.",
  ];
  
  // Love and commitment quotes
  static const List<String> loveQuotes = [
    "The best love stories are written one day at a time.",
    "Love grows stronger when two hearts choose each other, every day.",
    "True love is not about perfection. It is about commitment.",
    "Love is not just looking at each other, it's looking in the same direction.",
    "The best thing to hold onto in life is each other.",
  ];
  
  // Memory and journey quotes
  static const List<String> memoryQuotes = [
    "Some memories become treasures simply because we lived them together.",
    "Life is a journey, and love makes it worthwhile.",
    "Every moment spent together is a memory worth keeping.",
    "The little moments become the big memories.",
    "In the end, we only regret the chances we didn't take and the time we didn't spend with those we love.",
  ];
  
  // Personal quotes section - Add your own here
  static const List<String> personalQuotes = [
    // Add your personal quotes here
    // Example:
    // "Mom and Dad, you are my inspiration.",
    // "Thank you for showing us what true love looks like.",
  ];
  
  /// Get all quotes combined
  static List<String> getAllQuotes() {
    return [
      ...anniversaryQuotes,
      ...familyQuotes,
      ...loveQuotes,
      ...memoryQuotes,
      ...personalQuotes,
    ];
  }
  
  /// Get quotes by category
  static List<String> getQuotesByCategory(QuoteCategory category) {
    switch (category) {
      case QuoteCategory.anniversary:
        return anniversaryQuotes;
      case QuoteCategory.family:
        return familyQuotes;
      case QuoteCategory.love:
        return loveQuotes;
      case QuoteCategory.memory:
        return memoryQuotes;
      case QuoteCategory.personal:
        return personalQuotes;
      case QuoteCategory.all:
        return getAllQuotes();
    }
  }
}

/// Quote categories for organization
enum QuoteCategory {
  anniversary,
  family,
  love,
  memory,
  personal,
  all,
}

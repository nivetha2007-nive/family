import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/animation_config.dart';
import '../constants/quotes.dart';

/// Global quote manager - maintains timer across the entire app
class QuoteManager extends ChangeNotifier {
  static final QuoteManager _instance = QuoteManager._internal();
  factory QuoteManager() => _instance;
  
  QuoteManager._internal() {
    // Show first quote immediately after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      _showNextQuote();
    });
    // Then start regular timer
    _startQuoteTimer();
  }
  
  Timer? _timer;
  String? _currentQuote;
  bool _isVisible = false;
  final Random _random = Random();
  final List<String> _shownQuotes = [];
  
  String? get currentQuote => _currentQuote;
  bool get isVisible => _isVisible;
  
  void _startQuoteTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      AnimationConfig.quoteCycleDuration,
      (_) => _showNextQuote(),
    );
  }
  
  void _showNextQuote() {
    final allQuotes = LoveQuotes.getAllQuotes();
    if (allQuotes.isEmpty) return;
    
    // Get a quote that hasn't been shown recently
    String nextQuote;
    if (_shownQuotes.length >= allQuotes.length) {
      _shownQuotes.clear();
    }
    
    do {
      nextQuote = allQuotes[_random.nextInt(allQuotes.length)];
    } while (_shownQuotes.contains(nextQuote) && _shownQuotes.length < allQuotes.length);
    
    _shownQuotes.add(nextQuote);
    
    _currentQuote = nextQuote;
    _isVisible = true;
    notifyListeners();
    
    // Hide after display duration
    Future.delayed(AnimationConfig.quoteDisplayDuration, () {
      _isVisible = false;
      notifyListeners();
    });
  }
  
  /// Manually trigger a quote (for testing or special moments)
  void triggerQuote() {
    _showNextQuote();
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

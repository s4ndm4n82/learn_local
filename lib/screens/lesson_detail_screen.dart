import 'package:flutter/material.dart';
import '../models/app_models.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lessons lesson;
  final String language;

  const LessonDetailScreen({
    super.key,
    required this.lesson,
    required this.language,
  });

  @override
  LessonDetailScreenState createState() => LessonDetailScreenState();
}

class LessonDetailScreenState extends State<LessonDetailScreen> {
  int currentPhraseIndex = 0;
  bool isPlaying = false;

  // Sample phrases for the lesson
  final Map<String, List<Phrase>> lessonPhrases = {
    'Hindi_Basic Greetings': [
      Phrase(
        localletters: 'नमस्ते',
        english: 'Hello',
        local: 'Namaste',
        pronunciation: 'nah-mah-stay',
      ),
      Phrase(
        localletters: 'आप कैसे हैं?',
        english: 'How are you?',
        local: 'Aap kaise hain?',
        pronunciation: 'ahp kai-say hain',
      ),
      Phrase(
        localletters: 'धन्यवाद',
        english: 'Thank you',
        local: 'Dhanyavaad',
        pronunciation: 'dhuhn-yuh-vaad',
      ),
      Phrase(
        localletters: 'शुभ रात्रि',
        english: 'Good night',
        local: 'Shubh Raatri',
        pronunciation: 'shubh rah-tree',
      ),
      Phrase(
        localletters: 'शुभ प्रभात',
        english: 'Good morning',
        local: 'Shubh Prabhaat',
        pronunciation: 'shubh pruh-bhaat',
      ),
      Phrase(
        localletters: 'शुभ संध्या',
        english: 'Good evening',
        local: 'Shubh Sandhya',
        pronunciation: 'shubh suhn-dhyaa',
      ),
    ],

    'Hindi_Numbers 1-10': [
      Phrase(
        localletters: 'एक',
        english: 'One',
        local: 'Ek',
        pronunciation: 'ayk',
      ),
      Phrase(
        localletters: 'दो',
        english: 'Two',
        local: 'Do',
        pronunciation: 'doh',
      ),
      Phrase(
        localletters: 'तीन',
        english: 'Three',
        local: 'Teen',
        pronunciation: 'teen',
      ),
      Phrase(
        localletters: 'चार',
        english: 'Four',
        local: 'Chaar',
        pronunciation: 'chaar',
      ),
      Phrase(
        localletters: 'पाँच',
        english: 'Five',
        local: 'Paanch',
        pronunciation: 'paanch',
      ),
      Phrase(
        localletters: 'छह',
        english: 'Six',
        local: 'Chhah',
        pronunciation: 'chhah',
      ),
      Phrase(
        localletters: 'सात',
        english: 'Seven',
        local: 'Saat',
        pronunciation: 'saat',
      ),
      Phrase(
        localletters: 'आठ',
        english: 'Eight',
        local: 'Aath',
        pronunciation: 'aath',
      ),
      Phrase(
        localletters: 'नौ',
        english: 'Nine',
        local: 'Nau',
        pronunciation: 'nau',
      ),
      Phrase(
        localletters: 'दस',
        english: 'Ten',
        local: 'Das',
        pronunciation: 'dahs',
      ),
    ],
    'Yoruba_Basic Greetings': [
      Phrase(
        localletters: 'Ẹ n lẹ',
        english: 'Hello',
        local: 'Ẹ n lẹ',
        pronunciation: 'eh n leh',
      ),
      Phrase(
        localletters: 'Bawo ni',
        english: 'How are you?',
        local: 'Bawo ni',
        pronunciation: 'bah-woh nee',
      ),
      Phrase(
        localletters: 'O seun',
        english: 'Thank you',
        local: 'O seun',
        pronunciation: 'oh shay-oon',
      ),
      Phrase(
        localletters: 'O daaro',
        english: 'Good night',
        local: 'O daaro',
        pronunciation: 'oh dah-rah-roh',
      ),
      Phrase(
        localletters: 'Ẹ kú àtàárọ̀',
        english: 'Good morning',
        local: 'Ẹ kú àtàárọ̀',
        pronunciation: 'eh koo ah-tah-roh',
      ),
      Phrase(
        localletters: 'Ẹ kú àtàárọ̀ ọ̀sán',
        english: 'Good afternoon',
        local: 'Ẹ kú àtàárọ̀ ọ̀sán',
        pronunciation: 'eh koo ah-tah-roh oh-sahn',
      ),
      Phrase(
        localletters: 'Ẹ kú àtàárọ̀ alẹ́',
        english: 'Good evening',
        local: 'Ẹ kú àtàárọ̀ alẹ́',
        pronunciation: 'eh koo ah-tah-roh ah-leh',
      ),
    ],

    'Swahili_Basic Greetings': [
      Phrase(
        localletters: 'Habari',
        english: 'Hello',
        local: 'Habari',
        pronunciation: 'hah-bah-ree',
      ),
      Phrase(
        localletters: 'Habari gani?',
        english: 'How are you?',
        local: 'Habari gani?',
        pronunciation: 'hah-bah-ree gah-nee',
      ),
      Phrase(
        localletters: 'Asante',
        english: 'Thank you',
        local: 'Asante',
        pronunciation: 'ah-sahn-teh',
      ),
      Phrase(
        localletters: 'Usiku mwema',
        english: 'Good night',
        local: 'Usiku mwema',
        pronunciation: 'oo-see-koo mweh-mah',
      ),
      Phrase(
        localletters: 'Habari ya asubuhi',
        english: 'Good morning',
        local: 'Habari ya asubuhi',
        pronunciation: 'hah-bah-ree yah ah-soo-boo-hee',
      ),
      Phrase(
        localletters: 'Habari ya mchana',
        english: 'Good afternoon',
        local: 'Habari ya mchana',
        pronunciation: 'hah-bah-ree yah m-chah-nah',
      ),
      Phrase(
        localletters: 'Habari ya jioni',
        english: 'Good evening',
        local: 'Habari ya jioni',
        pronunciation: 'hah-bah-ree yah jee-oh-nee',
      ),
    ],

    'Bengali_Basic Greetings': [
      Phrase(
        localletters: 'নমস্কার',
        english: 'Hello',
        local: 'Nomoskar',
        pronunciation: 'noh-moh-skar',
      ),
      Phrase(
        localletters: 'আপনি কেমন আছেন?',
        english: 'How are you?',
        local: 'Apni kemon achen?',
        pronunciation: 'ahp-nee kay-mohn ah-chen',
      ),
      Phrase(
        localletters: 'ধন্যবাদ',
        english: 'Thank you',
        local: 'Dhonnobad',
        pronunciation: 'dhon-noh-baad',
      ),
      Phrase(
        localletters: 'শুভ রাত্রি',
        english: 'Good night',
        local: 'Shuvo Ratri',
        pronunciation: 'shoo-voh rah-tree',
      ),
      Phrase(
        localletters: 'শুভ সকাল',
        english: 'Good morning',
        local: 'Shuvo Shokal',
        pronunciation: 'shoo-voh shoh-kahl',
      ),
      Phrase(
        localletters: 'শুভ অপরাহ্ন',
        english: 'Good afternoon',
        local: 'Shuvo Aporahno',
        pronunciation: 'shoo-voh ah-poh-rah-noh',
      ),
      Phrase(
        localletters: 'শুভ সন্ধ্যা',
        english: 'Good evening',
        local: 'Shuvo Shondha',
        pronunciation: 'shoo-voh shon-dhah',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final phraseKey = '${widget.language}_${widget.lesson.title}';
    final phrases = lessonPhrases[phraseKey] ?? [];

    if (phrases.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.lesson.title),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.construction, size: 64.0, color: Colors.green),
              SizedBox(height: 16.0),
              Text(
                'Lesson content is being prepared',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'This lesson will be available soon!',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    final currentPhrase = phrases[currentPhraseIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _showLessonInfo(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Indicator
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: (currentPhraseIndex + 1) / phrases.length,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
                SizedBox(width: 12.0),
                Text(
                  '${currentPhraseIndex + 1}/${phrases.length}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 32.0),

            // Main Phrase Card
            Expanded(
              child: Card(
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Local Letters
                      Text(
                        currentPhrase.localletters,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),

                      // English Translation
                      Text(
                        currentPhrase.english,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.0),

                      // Local Pronunciation
                      Text(
                        currentPhrase.local,
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.0),

                      // Pronunciation Guide
                      Text(
                        currentPhrase.pronunciation,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.0),

                      // Audio Playback Button
                      ElevatedButton.icon(
                        onPressed: _playAudio,
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        label: Text(isPlaying ? 'Playing ....' : 'Play Audio'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 16.0,
                          ),
                          textStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),

            // Speech practice section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.mic, color: Colors.blue),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Practice Speaking',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tap the microphone to practice saying this phrase',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _showSpeechPractice(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(16.0),
                        ),
                        child: Icon(Icons.mic, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: currentPhraseIndex > 0
                      ? () => setState(() => currentPhraseIndex--)
                      : null,
                  icon: Icon(Icons.arrow_back),
                  label: Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: currentPhraseIndex < phrases.length - 1
                      ? () => setState(() => currentPhraseIndex++)
                      : () => _completeLesson(context),
                  icon: Icon(
                    currentPhraseIndex < phrases.length - 1
                        ? Icons.arrow_forward
                        : Icons.check,
                  ),
                  label: Text(
                    currentPhraseIndex < phrases.length - 1
                        ? 'Next'
                        : 'Complete',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _playAudio() {
    setState(() => isPlaying = true);

    // Simulate audio playback
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) setState(() => isPlaying = false);
    });

    // Show Feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Playing: "${lessonPhrases['${widget.language}_${widget.lesson.title}']![currentPhraseIndex].local}"',
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSpeechPractice(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Speech Practice'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mic, size: 64.0, color: Colors.red),
            SizedBox(height: 16.0),
            Text(
              'Say: "${lessonPhrases['${widget.language}_${widget.lesson.title}']![currentPhraseIndex].local}"',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text('Listening .....', style: TextStyle(color: Colors.red)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showPronunciationScore(context);
            },
            child: Text('Stop'),
          ),
        ],
      ),
    );
  }

  void _showPronunciationScore(BuildContext context) {
    // Simulate pronunciation score
    final score = 75 + (currentPhraseIndex * 3);
    final adjustedScore = score > 100 ? 100 : score;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pronunciation Score'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: CircularProgressIndicator(
                    value: adjustedScore / 100,
                    backgroundColor: Colors.grey.shade300,
                    strokeWidth: 8.0,
                  ),
                ),
                Text(
                  '$adjustedScore%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              adjustedScore >= 90
                  ? 'Excellent! 🎉'
                  : adjustedScore >= 75
                  ? 'Great job! 👏'
                  : adjustedScore >= 60
                  ? 'Good effort! 👍'
                  : 'Keep practicing! 💪',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showLessonInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lesson Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Language: ${widget.language}'),
            SizedBox(height: 8),
            Text('Lesson: ${widget.lesson.title}'),
            SizedBox(height: 8),
            Text('Progress: ${(widget.lesson.progress * 100).toInt()}%'),
            SizedBox(height: 8),
            Text('Description: ${widget.lesson.description}'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _completeLesson(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lesson Complete! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.celebration, size: 64, color: Colors.orange),
            SizedBox(height: 16),
            Text(
              'Congratulations! You\'ve completed the ${widget.lesson.title} lesson.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              '+50 XP earned!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to lessons list
            },
            child: Text('Continue Learning'),
          ),
        ],
      ),
    );
  }
}

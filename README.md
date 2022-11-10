# counter_7

**Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.**
stateful widget bersifat dinamis, artinya setiap *user* melakukan suatu hal (berinteraksi) dengan widget tersebut, maka widget akan berubah. Contoh dari stateful widget adalah checkbox, Radio slider, InkWell, Form, dan Textfield. Disisi lain, stateless widget adalah widget yang bersifat statis (tetap), artinya meskipun ada event yang terjadi atau ada data yang diterima oleh widget, widget tidak akan berubah. Contoh dari stateless widget adalah Icon, IconButton, dan Text

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
Widget yang digunakan pada project kali ini terbagi menjadi 3. Pertama, basic widget yang terdiri dari AppBar, Icons, Scaffold, Column, Row, Container. Kedua, text widget yang terdiri dari Text & Textstyle. Ketiga, interactivity widget yang terdiri dari Floating Action Button.

**Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**
setState() merupakan sebuah cara dalam flutter untuk menginfokan bahwa ada suatu internal state yang berubah (dalam projek ini merupakan sebuah variabel counter) dan akan berdampak terhadap tampilan visual yang dilihat user. Oleh karena itu, perlu dilakukan *rebuild* terhadap state object yang bersangkutan.

**Jelaskan perbedaan antara const dengan final.**
Tipe data const dan final memiliki perilaku yang sama. Perbedaannya terletak pada saat compile time, tipe data const membuat variabel menjadi constant saat compile time. Object atau variabel yang berada pada state constant saat compile time menjadi *frozen* dan *immutable*

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
1. Buat suatu project flutter yang bernama counter_7
2. Buka project counter_7 di IDE dan masuk ke file main.dart pada folder lib
3. Menambahkan fungsi decrement counter pada class _MyHomePageState 
```dart
void _decrementCounter() {
    setState(() {
      if(_counter > 0){
      _counter--;
      }
    });
  }
```
4. Membuat conditionals agar text yang ditampilkan berbeda saat kondisi ganjil dan genap
```dart
if(_counter % 2 == 0)...[
            Text(
                'GENAP',
              // '$_counter',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),]
          else ...[
            Text(
              'GANJIL',
               style: TextStyle(// 
               fontSize: 24,
               color: Colors.blueAccent,
               ),
            )
          ],
```
5. Membuat widget Floating Action Button row yang berisi 2 button FloatingActionButton yaitu tombol untuk increment dan tombol untuk decrement. Tombol untuk decrement akan di hide saat counter bernilai 0
```dart
floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if(_counter != 0)FloatingActionButton( // first FAB to perform decrement 
            onPressed: _decrementCounter,
            child: Icon(Icons.remove),
            
            
          ),
          FloatingActionButton( // second FAB to perform increment

            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          ),
        ],
      ),//trailing comma makes auto-formatting nicer for build methods.
```
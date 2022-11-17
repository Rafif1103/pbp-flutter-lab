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



--------------------------------------------------TUGAS 8 README----------------------------------------------------

**Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement**
Navigator.pushReplacement merupakan salah satu cara untuk menghapus page yang sedang dilihat sambil kita keluar dari page tersebut. Navigator.pushReplacement hanya mengganti top of stack atau top route nya saja. Navigator.push merupakan salah satu cara untuk melakukan routing dari satu page ke page lain pada flutter. Perbedaan kedua Navigator tersebut adalah pushReplacement menambahkan route sambil menghapus top of route. Sedangkan method push hanya melakukan push route tanpa pop atau menghapus route sebelumnya

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya**
1. Basic Widget: Column, Container, appBar, Icons, Row
2. Text Widget: Text, TextStyle, TextButton
3. Interactivity Widget: FloatingActionButton

**Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).**
1. Event onPressed, trigger saat suatu button ditekan (biasanya saat ditekan dengan LMB)
Contoh:
```dart
TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
```
2. Event onChange, trigger saat terjadi perubahan seperti pada TextField
Contoh:
```dart
TextField(
          controller: _controller,
          onChanged: (String value) async {
            if (value != '13') {
              return;
            }
      ...
```
3. Event onClick, trigger saat button ditekan baik oleh mouse atau secara langsung dengan tangan
Contoh:
```dart
Stream<MouseEvent> get onClick => Element.clickEvent.forTarget(this);
```
4. Event onSave, trigger saat isi final dari form di save menggunakan FormState.save
Contoh:
```dart
final FormFieldSetter<T>? onSaved;
```

**Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.**
Navigator akan melakukan routing halaman pada drawer yang bekerja mirip seperti mekanisme / cara kerja stack. Dimana, halaman yang akan diakses berikutnya, akan di push ke dalam stack dan halaman sebelumnya akan berada di bawah halaman yang baru ditambahkan. Jika kita ingin mengakses halaman sebelumnya, kita dapat melakukan pop pada top of stack dengan method pop().

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
1. Membuat form.dart dan result.dart sebagai halaman untuk membuat form dan menampilkan hasil form
2. Mengimplementasikan drawer sehingga user dapat navigate ke semua halaman
3. Pada form.dart Membuat text field form untuk judul dan nominal
4. Membuat suatu dropdown menu untuk memilih tipe budget user beserta tombol untuk save informasi
5. Menyimpan informasi dari form pada sebuah List
6. Mengiterasikan List tersebut dan menampilkannya pada result.dart
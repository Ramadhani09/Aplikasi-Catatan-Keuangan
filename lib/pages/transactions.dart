import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFE6F7F6),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Pencatatan Transaksi',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pemasukan'),
              Tab(text: 'Pengeluaran'),
            ],
          ),
        ),
        body: const TabBarView(children: [_IncomeForm(), _ExpenseForm()]),
      ),
    );
  }
}

class _IncomeForm extends StatefulWidget {
  const _IncomeForm();
  @override
  State<_IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<_IncomeForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime;
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  String _paymentMethod = 'Tunai';
  String _category = 'Penjualan Eceran';

  @override
  void dispose() {
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                _dateTime == null
                    ? 'Pilih Tanggal & Waktu'
                    : _dateTime.toString(),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDateTime,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                hintText:
                    'Contoh: Penjualan Kerupuk Udang 10 bungkus ke Toko A',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah (Rp)',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _paymentMethod,
              decoration: const InputDecoration(labelText: 'Metode Pembayaran'),
              items: const [
                DropdownMenuItem(value: 'Tunai', child: Text('Tunai')),
                DropdownMenuItem(
                  value: 'Transfer Bank',
                  child: Text('Transfer Bank'),
                ),
                DropdownMenuItem(value: 'QRIS', child: Text('QRIS')),
              ],
              onChanged: (v) => setState(() => _paymentMethod = v ?? 'Tunai'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Kategori'),
              items: const [
                DropdownMenuItem(
                  value: 'Penjualan Eceran',
                  child: Text('Penjualan Eceran'),
                ),
                DropdownMenuItem(
                  value: 'Penjualan Grosir',
                  child: Text('Penjualan Grosir'),
                ),
                DropdownMenuItem(
                  value: 'Pendapatan Lain-lain',
                  child: Text('Pendapatan Lain-lain'),
                ),
              ],
              onChanged: (v) =>
                  setState(() => _category = v ?? 'Penjualan Eceran'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pemasukan disimpan (dummy)'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Simpan Pemasukan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpenseForm extends StatefulWidget {
  const _ExpenseForm();
  @override
  State<_ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<_ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime;
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  String _category = 'HPP';
  String _subCategory = 'Bahan Baku';

  @override
  void dispose() {
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                _dateTime == null
                    ? 'Pilih Tanggal & Waktu'
                    : _dateTime.toString(),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDateTime,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                hintText: 'Contoh: Pembelian Tepung Tapioka 50kg',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah (Rp)',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Kategori Biaya'),
              items: const [
                DropdownMenuItem(value: 'HPP', child: Text('HPP (Bahan Baku)')),
                DropdownMenuItem(
                  value: 'Operasional',
                  child: Text('Biaya Operasional'),
                ),
                DropdownMenuItem(
                  value: 'Lain-lain',
                  child: Text('Biaya Lain-lain'),
                ),
              ],
              onChanged: (v) => setState(() => _category = v ?? 'HPP'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _subCategory,
              decoration: const InputDecoration(labelText: 'Sub Kategori'),
              items: const [
                DropdownMenuItem(
                  value: 'Bahan Baku',
                  child: Text('Bahan Baku'),
                ),
                DropdownMenuItem(value: 'Gaji', child: Text('Gaji Karyawan')),
                DropdownMenuItem(
                  value: 'Listrik/Air',
                  child: Text('Listrik/Air'),
                ),
                DropdownMenuItem(value: 'Gas', child: Text('Gas')),
                DropdownMenuItem(
                  value: 'Pemasaran',
                  child: Text('Biaya Pemasaran'),
                ),
                DropdownMenuItem(
                  value: 'Transportasi',
                  child: Text('Transportasi'),
                ),
                DropdownMenuItem(
                  value: 'Perbaikan',
                  child: Text('Perbaikan Alat'),
                ),
              ],
              onChanged: (v) =>
                  setState(() => _subCategory = v ?? 'Bahan Baku'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pengeluaran disimpan (dummy)'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Simpan Pengeluaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

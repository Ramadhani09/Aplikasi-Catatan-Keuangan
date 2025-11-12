import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _period = 'Bulanan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7F6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Laporan Keuangan',
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Periode:'),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _period,
                  items: const [
                    DropdownMenuItem(value: 'Harian', child: Text('Harian')),
                    DropdownMenuItem(
                      value: 'Mingguan',
                      child: Text('Mingguan'),
                    ),
                    DropdownMenuItem(value: 'Bulanan', child: Text('Bulanan')),
                    DropdownMenuItem(value: 'Tahunan', child: Text('Tahunan')),
                  ],
                  onChanged: (v) => setState(() => _period = v ?? 'Bulanan'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ReportCard(
              title: 'Laporan Laba Rugi Sederhana',
              children: const [
                _LineItem(label: 'Penjualan Bersih', value: 'Rp0'),
                _LineItem(label: 'HPP (Harga Pokok Penjualan)', value: 'Rp0'),
                Divider(),
                _LineItem(label: 'Laba Kotor', value: 'Rp0'),
                _LineItem(label: 'Biaya Operasional', value: 'Rp0'),
                Divider(),
                _LineItem(label: 'Laba Bersih', value: 'Rp0'),
              ],
            ),
            const SizedBox(height: 12),
            _ReportCard(
              title: 'Laporan Arus Kas',
              children: const [
                _LineItem(label: 'Kas Masuk', value: 'Rp0'),
                _LineItem(label: 'Kas Keluar', value: 'Rp0'),
                Divider(),
                _LineItem(label: 'Saldo Kas', value: 'Rp0'),
              ],
            ),
            const SizedBox(height: 12),
            _ReportCard(
              title: 'Pengeluaran Berdasarkan Kategori',
              children: const [
                _LineItem(label: 'HPP', value: 'Rp0'),
                _LineItem(label: 'Operasional', value: 'Rp0'),
                _LineItem(label: 'Lain-lain', value: 'Rp0'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _ReportCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _LineItem extends StatelessWidget {
  final String label;
  final String value;
  const _LineItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkTheme = false;
  String _font = 'Default';
  String _language = 'Indonesia';

  void _chooseOption({
    required String title,
    required List<String> options,
    required String current,
    required ValueChanged<String> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              ...options.map(
                (o) => RadioListTile<String>(
                  title: Text(o),
                  value: o,
                  groupValue: current,
                  onChanged: (v) {
                    if (v != null) {
                      onSelected(v);
                      Navigator.pop(ctx);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white, letterSpacing: 1.2),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Satu kartu gabungan: General Settings + Data Master
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  // General Settings
                  SwitchListTile(
                    secondary: const Icon(Icons.notifications_none),
                    title: const Text('Notification'),
                    value: _notifications,
                    onChanged: (v) => setState(() => _notifications = v),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.font_download),
                    title: const Text('Font'),
                    subtitle: Text(_font),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _chooseOption(
                      title: 'Pilih Font',
                      options: const ['Default', 'Serif', 'Monospace'],
                      current: _font,
                      onSelected: (v) => setState(() => _font = v),
                    ),
                  ),
                  const Divider(height: 0),
                  SwitchListTile(
                    secondary: const Icon(Icons.lightbulb_outline),
                    title: const Text('Theme'),
                    value: _darkTheme,
                    onChanged: (v) => setState(() => _darkTheme = v),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    subtitle: Text(_language),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _chooseOption(
                      title: 'Pilih Bahasa',
                      options: const ['Indonesia', 'English'],
                      current: _language,
                      onSelected: (v) => setState(() => _language = v),
                    ),
                  ),

                  // Data Master
                  const Divider(height: 16),
                  ListTile(
                    leading: const Icon(Icons.category),
                    title: const Text('Kategori Pemasukan & Pengeluaran'),
                    subtitle: const Text('Kelola kategori transaksi'),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.inventory),
                    title: const Text('Daftar Bahan Baku'),
                    subtitle: const Text('Kelola bahan baku'),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: const Text('Daftar Produk Jual'),
                    subtitle: const Text('Kelola produk dan harga'),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('Manajemen Pengguna'),
                    subtitle: const Text('Tambah/atur pengguna'),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.backup),
                    title: const Text('Backup Data'),
                    subtitle: const Text('Ekspor/impor data'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

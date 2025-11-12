import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFE6F7F6),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Inventaris & Produksi',
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
              Tab(text: 'Bahan Baku'),
              Tab(text: 'Produk Jadi'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_RawMaterialsTab(), _FinishedGoodsTab()],
        ),
      ),
    );
  }
}

class _RawMaterialsTab extends StatelessWidget {
  const _RawMaterialsTab();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daftar Bahan Baku',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Tepung Tapioka'),
                  subtitle: Text('Stok: 0'),
                ),
                ListTile(title: Text('Udang'), subtitle: Text('Stok: 0')),
                ListTile(title: Text('Bumbu'), subtitle: Text('Stok: 0')),
                ListTile(
                  title: Text('Minyak Goreng'),
                  subtitle: Text('Stok: 0'),
                ),
                ListTile(title: Text('Kemasan'), subtitle: Text('Stok: 0')),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Input stok bahan (dummy)')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Input Stok Bahan Baku'),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinishedGoodsTab extends StatelessWidget {
  const _FinishedGoodsTab();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daftar Produk Jadi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Kerupuk Udang'),
                  subtitle: Text('Stok: 0 • Harga: Rp0'),
                ),
                ListTile(
                  title: Text('Kerupuk Bawang'),
                  subtitle: Text('Stok: 0 • Harga: Rp0'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Catat produksi (dummy)')),
                );
              },
              icon: const Icon(Icons.factory),
              label: const Text('Catat Produksi'),
            ),
          ),
        ],
      ),
    );
  }
}

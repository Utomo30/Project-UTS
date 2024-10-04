import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // State variables for the toggle switches
  bool isNotifikasiLayananEnabled = true;
  bool isUpdateKanvasEnabled = true;
  bool isTiketHarianEnabled = true;

  // Function to load preferences
  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotifikasiLayananEnabled = prefs.getBool('notifikasiLayanan') ?? true;
      isUpdateKanvasEnabled = prefs.getBool('updateKanvas') ?? true;
      isTiketHarianEnabled = prefs.getBool('tiketHarian') ?? true;
    });
  }

  // Function to save preferences
  void savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifikasiLayanan', isNotifikasiLayananEnabled);
    await prefs.setBool('updateKanvas', isUpdateKanvasEnabled);
    await prefs.setBool('tiketHarian', isTiketHarianEnabled);
  }

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Menu Pilihan Section
          Text('PILIHAN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ListTile(
            title: Text('Bahasa'),
            onTap: () {
              // Navigasi ke halaman pengaturan bahasa (implementasikan halaman ini terpisah)
              Get.toNamed('/settings/language');
            },
          ),
          ListTile(
            title: Text('Resolusi gambar'),
            onTap: () {
              // Navigasi ke halaman pengaturan resolusi (implementasikan halaman ini terpisah)
              Get.toNamed('/settings/resolution');
            },
          ),
          ListTile(
            title: Text('Hapus cache'),
            subtitle: Text('2,45 MB'),
            onTap: () {
              // Implementasikan fungsi hapus cache di sini
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Cache berhasil dihapus!'),
              ));
            },
          ),
          ListTile(
            title: Text('Atur Perangkat'),
            onTap: () {
              // Implementasikan navigasi atau pengaturan perangkat
              Get.toNamed('/settings/device');
            },
          ),
          ListTile(
            title: Text('Pengaturan Tema'),
            onTap: () {
              // Implementasikan pengaturan tema
              Get.toNamed('/settings/theme');
            },
          ),
          Divider(),

          // Notifikasi Section
          Text('Notifikasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: Text('Notifikasi Layanan'),
            value: isNotifikasiLayananEnabled,
            onChanged: (bool value) {
              setState(() {
                isNotifikasiLayananEnabled = value;
                savePreferences();
              });
            },
          ),
          SwitchListTile(
            title: Text('Update KANVAS'),
            value: isUpdateKanvasEnabled,
            onChanged: (bool value) {
              setState(() {
                isUpdateKanvasEnabled = value;
                savePreferences();
              });
            },
          ),
          SwitchListTile(
            title: Text('Tiket Harian'),
            value: isTiketHarianEnabled,
            onChanged: (bool value) {
              setState(() {
                isTiketHarianEnabled = value;
                savePreferences();
              });
            },
          ),
          // Tambahkan SwitchListTile lain sesuai kebutuhan (misal: Komentar terbaik, Balasan, dsb.)

          Divider(),
          // Info terbaru section
          Text('Info Terbaru', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: Text('Baru Dirilis'),
            value: true, // Tambahkan logika state management jika perlu
            onChanged: (bool value) {
              // Logika penyimpanan ke shared preferences bisa diterapkan di sini
            },
          ),
          SwitchListTile(
            title: Text('Pemberitahuan & Event'),
            value: true, // Tambahkan logika state management jika perlu
            onChanged: (bool value) {
              // Logika penyimpanan ke shared preferences bisa diterapkan di sini
            },
          ),
        ],
      ),
    );
  }
}

class Agenda {
  var namaAcara, penyelenggara, batasPendaftaran, lokasi, deskripsi, gambar;
  Waktu waktu;

  Agenda(this.namaAcara, this.penyelenggara, this.batasPendaftaran, this.waktu,
      this.lokasi, this.deskripsi, this.gambar);

  getNamaAcara() => this.namaAcara;
  getPenyelenggara() => this.penyelenggara;
  getBatasPendaftaran() => this.batasPendaftaran;
  Waktu getWaktu() => this.waktu;
  getLokasi() => this.lokasi;
  getDeskripsi() => this.deskripsi;
  getGambar() => this.gambar;
}

class Waktu {
  var tanggal, jamMulai, jamSelesai;
  Waktu(this.tanggal, this.jamMulai, this.jamSelesai);

  getTanggal() => this.tanggal;
  getJamMulai() => this.jamMulai;
  getJamSelesai() => this.jamSelesai;
}

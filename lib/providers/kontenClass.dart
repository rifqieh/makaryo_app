class Konten {
  var idKonten, kategori, jenis, bookmark, judul, url;

  Konten(this.idKonten, this.kategori, this.jenis, this.bookmark, this.judul,
      this.url);

  getIdKonten() => this.idKonten;
  getKategori() => this.kategori;
  getJenis() => this.jenis;
  getBookmark() => this.bookmark;
  getJudul() => this.judul;
  getUrl() => this.url;

  setBookmark() => this.bookmark = !this.bookmark;
}

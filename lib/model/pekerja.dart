class Pekerja {
    int id;
    String nama;
    int usia;
    String pekerjaan;
    String biografi;
    DateTime createdAt;
    DateTime updatedAt;

    Pekerja({
        required this.id,
        required this.nama,
        required this.usia,
        required this.pekerjaan,
        required this.biografi,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Pekerja.fromJson(Map<String, dynamic> json) => Pekerja(
        id: json["id"],
        nama: json["nama"],
        usia: json["usia"],
        pekerjaan: json["pekerjaan"],
        biografi: json["biografi"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"])
    );
}
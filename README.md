# MRT OS

[![Build ISO](https://github.com/mrt-os/mrt-os/actions/workflows/build-iso.yml/badge.svg)](https://github.com/mrt-os/mrt-os/actions/workflows/build-iso.yml)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

**MRT OS**, Fedora 44 tabanlı, KDE Plasma masaüstü ortamıyla gelen modern, hızlı ve kullanıcı dostu bir Linux dağıtımıdır. Universal Blue'un Kinoite imajı üzerine inşa edilerek geliştirilmiş olup, hem günlük kullanım hem de Windows uygulamalarını çalıştırma ihtiyacı duyan kullanıcılar için optimize edilmiştir.

## 🌟 Özellikler

- **Fedora 44 Tabanı**: En güncel Fedora teknolojileri ve güvenlik yamaları
- **KDE Plasma Masaüstü**: Modern, özelleştirilebilir ve şık kullanıcı arayüzü
- **Wine & Winetricks Desteği**: Windows uygulamalarını (.exe) çift tıklayarak çalıştırın
- **Flatpak Entegrasyonu**: Flathub deposu önceden yapılandırılmıştır
- **GNOME Software**: Kolay uygulama yönetimi ve güncellemeler
- **Canlı ISO**: Sistemi kurmadan deneyimleme imkanı
- **Otomatik Derleme**: GitHub Actions ile sürekli entegrasyon ve dağıtım

## 📦 Dahili Paketler

MRT OS aşağıdaki paketlerle birlikte gelir:

| Paket | Açıklama |
|-------|----------|
| `wine` | Windows uygulama uyumluluk katmanı |
| `winetricks` | Wine yapılandırma yardımcısı |
| `flatpak` | Evrensel paket yönetim sistemi |
| `gnome-software` | Grafiksel uygulama mağazası |
| `cabextract` | Microsoft CAB dosyası çıkarıcı |

## 🚀 Kurulum

### 1. ISO İndirme

En son sürüm ISO dosyasını [Releases](https://github.com/mrt-os/mrt-os/releases) sayfasından indirebilirsiniz.

### 2. USB Oluşturma

İndirdiğiniz ISO dosyasını bir USB belleğe yazdırın:

```bash
# Linux/macOS üzerinde
sudo dd if=mrt-os.iso of=/dev/sdX bs=4M status=progress && sync
```

Veya [BalenaEtcher](https://www.balena.io/etcher/) gibi grafik araçlar kullanabilirsiniz.

### 3. Canlı Sistem veya Kurulum

- USB'den önyükleme yapın
- "Try MRT OS" seçeneği ile sistemi kurmadan deneyin
- Kurulum için masaüstündeki kurulum sihirbazını takip edin

## 🛠️ Geliştirme

### Docker İmajı Oluşturma

```bash
docker build -t mrt-os .
```

### ISO Derleme

ISO dosyası GitHub Actions üzerinden otomatik olarak derlenir. Yerel olarak derlemek için:

```bash
# Gerekli bağımlılıkları yükleyin
sudo dnf install -y lorax livecd-tools

# Kickstart dosyasını kullanarak ISO oluşturun
livemedia-creator --make-iso --ks=kickstart.ks --project-name="MRT OS"
```

## 📁 Proje Yapısı

```
mrt-os/
├── Dockerfile              # Konteyner imajı yapılandırması
├── README.md               # Bu dosya
└── .github/
    └── workflows/
        └── build-iso.yml   # ISO derleme otomasyonu
```

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen şu adımları izleyin:

1. Projeyi fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request açın

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakınız.

## 🔗 Bağlantılar

- [Universal Blue](https://ublue.it/)
- [Fedora Project](https://getfedora.org/)
- [KDE Plasma](https://kde.org/plasma-desktop)
- [WineHQ](https://www.winehq.org/)
- [Flathub](https://flathub.org/)

---

**MRT OS** - Güçlü, Esnek, Özgür
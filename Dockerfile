# Temel olarak resmi Fedora KDE (Kinoite) imajını alıyoruz
FROM quay.io/fedora-ostree-desktops/kinoite:latest

# 1. MRT OS Sistem Adını Ayarla
RUN sed -i 's/^NAME=.*/NAME="MRT OS"/' /usr/lib/os-release && \
    sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="MRT OS (KDE Edition)"/' /usr/lib/os-release && \
    sed -i 's/^ID=.*/ID=mrtos/' /usr/lib/os-release

# 2. İstenen Paketleri Yükle (Wine, GNOME Software, Flatpak)
RUN dnf install -y \
    wine \
    winetricks \
    gnome-software \
    flatpak \
    cabextract && \
    dnf clean all

# 3. .EXE Dosyalarını Çift Tıklayınca Açacak Başlatıcıyı Ekle
RUN mkdir -p /usr/share/applications /etc/xdg && \
    cat << 'EOF' > /usr/share/applications/wine-runner.desktop
[Desktop Entry]
Type=Application
Name=Wine Windows Program Loader
Comment=Windows uygulamalarını (.exe) çalıştırır
Exec=wine %f
MimeType=application/x-ms-dos-executable;application/x-msi;application/x-msdownload;application/x-dosexec;
Icon=wine
NoDisplay=false
StartupNotify=true
Terminal=false
Categories=Utility;System;
EOF

# 4. EXE / MSI Dosyalarını Wine ile Eşleştir
RUN cat << 'EOF' >> /etc/xdg/mimeapps.list
[Default Applications]
application/x-ms-dos-executable=wine-runner.desktop
application/x-msi=wine-runner.desktop
application/x-msdownload=wine-runner.desktop
application/x-dosexec=wine-runner.desktop

[Added Associations]
application/x-ms-dos-executable=wine-runner.desktop;
application/x-msi=wine-runner.desktop;
application/x-msdownload=wine-runner.desktop;
application/x-dosexec=wine-runner.desktop;
EOF

# 5. Flathub Mağaza Deposunu Ekle
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

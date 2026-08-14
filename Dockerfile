# En güncel Fedora 44 tabanlı Universal Blue KDE imajı
FROM ghcr.io/ublue-os/kinoite-main:44

# 1. MRT OS Sistem Adını Ayarla
RUN sed -i 's/^NAME=.*/NAME="MRT OS"/' /usr/lib/os-release && \
    sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="MRT OS 44 (KDE Edition)"/' /usr/lib/os-release && \
    sed -i 's/^ID=.*/ID=mrtos/' /usr/lib/os-release

# 2. İstenen Paketleri Yükle (Wine, GNOME Software, Flatpak)
RUN dnf install -y \
    wine \
    winetricks \
    gnome-software \
    flatpak \
    cabextract && \
    dnf clean all

# 3. .EXE Çift Tıklama Başlatıcısını Oluştur
RUN mkdir -p /usr/share/applications /etc/xdg && \
    printf "[Desktop Entry]\nType=Application\nName=Wine Windows Program Loader\nComment=Windows uygulamalarını (.exe) çalıştırır\nExec=wine %%f\nMimeType=application/x-ms-dos-executable;application/x-msi;application/x-msdownload;application/x-dosexec;\nIcon=wine\nNoDisplay=false\nStartupNotify=true\nTerminal=false\nCategories=Utility;System;\n" > /usr/share/applications/wine-runner.desktop

# 4. EXE / MSI Dosyalarını Wine ile Eşleştir
RUN printf "[Default Applications]\napplication/x-ms-dos-executable=wine-runner.desktop\napplication/x-msi=wine-runner.desktop\napplication/x-msdownload=wine-runner.desktop\napplication/x-dosexec=wine-runner.desktop\n\n[Added Associations]\napplication/x-ms-dos-executable=wine-runner.desktop;\napplication/x-msi=wine-runner.desktop;\napplication/x-msdownload=wine-runner.desktop;\napplication/x-dosexec=wine-runner.desktop;\n" >> /etc/xdg/mimeapps.list

# 5. Flathub Mağaza Deposunu Ekle
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

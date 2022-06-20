FROM ubuntu:20.04

MAINTAINER chenjh "1649991905@qq.com"

COPY mgs-linux /opt/mgs-linux/

RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" > /etc/apt/sources.list &&\
	apt-get clean && apt-get update &&\
	apt-get install -y locales && apt-get install -y language-pack-zh-hans &&\
	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 && locale-gen zh_CN.UTF-8 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
	apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
	apt-get install -y libxrender1 && apt-get install -y libxt6 && apt-get install -y libxext-dev && apt-get install -y libfreetype6-dev &&\
	apt-get install -y wget && apt-get install -y ttf-mscorefonts-installer && apt-get install -y fontconfig &&\
	apt-get install ttf-wqy-microhei &&\
	apt-get install ttf-wqy-zenhei &&\
	apt-get install xfonts-wqy &&\
	apt-get install -y unzip &&\
	
     cd /tmp &&\
     
#    安装ffmpeg（忍痛捐献白嫖地址）
     wget https://1649991905.cn:2331/ffmpeg-release-i686-static.tar.xz &&\
     tar -xvf ffmpeg-release-i686-static.tar.xz && mv /tmp/ffmpeg-5.0.1-i686-static /opt/ffmpeg &&\

#    安装字体（忍痛捐献白嫖地址）
     wget https://1649991905.cn:2331/chinese_fonts.zip &&\
	unzip /tmp/chinese_fonts.zip && mv /tmp/fonts /usr/share/fonts/chinese &&\

#	安装 OpenOffice
#	wget https://kkfileview.keking.cn/Apache_OpenOffice_4.1.6_Linux_x86-64_install-deb_zh-CN.tar.gz -cO openoffice_deb.tar.gz &&\
#	tar -zxf /tmp/openoffice_deb.tar.gz && cd /tmp/zh-CN/DEBS &&\
#	dpkg -i *.deb && dpkg -i desktop-integration/openoffice4.1-debian-menus_4.1.6-9790_all.deb &&\

#	安装 libreoffice
    apt-get install -y libxinerama1 libcairo2 libcups2 libx11-xcb1 &&\
    wget https://kkfileview.keking.cn/LibreOffice_7.1.4_Linux_x86-64_deb.tar.gz -cO libreoffice_deb.tar.gz &&\
    tar -zxf /tmp/libreoffice_deb.tar.gz && cd /tmp/LibreOffice_7.1.4.2_Linux_x86-64_deb/DEBS &&\
    dpkg -i *.deb &&\

    rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* &&\
    cd /usr/share/fonts/chinese &&\
    mkfontscale &&\
    mkfontdir &&\
    fc-cache -fv &&\
    chmod +x /opt/mgs-linux/mgs

WORKDIR /opt/mgs-linux/

ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

EXPOSE 9000

ENTRYPOINT ["./mgs"]
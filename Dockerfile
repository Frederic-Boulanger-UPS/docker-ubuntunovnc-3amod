# FROM fredblgr/ubuntunovnc-3asem:2020
FROM fredblgr/ubuntunovnc-3asem:2019

# Install xdg-utils because Eclipse uses it
RUN apt-get update -y && apt-get install xdg-utils -y

# Install Eclipse Modeling 2020-06
# Copy existing configuration containing:
# * Eclipse Modeling 2020-06
# * Acceleo 3.7 from the OBEO Market Place
# * From Install New Software (with all available sites)
#   * All Acceleo
#   * Additional Interpreters for Acceleo
#   * Modeling > all QVT operational
#   * Modeling > Xpand SDK
#   * Modeling > Xtext SDK
#   * Programming languages > C/C++ Dev Tools
#   * Programming languages > C/C++ library API doc hover help
#   * Programming languages > C/C++ Unit Testing
#   * Programming languages > Eclipse XML editors and tools
#   * Programming languages > Javascript dev tools
#   * Programming languages > Wild Web developer
ARG ECLIPSETGZ=eclipse-modeling-2020-06-3asl.tgz
ARG ECLIPSEINSTDIR=/usr/local/eclipse-modeling-2020-06
COPY resources/${ECLIPSETGZ} /usr/local/
RUN cd /usr/local; tar zxf ${ECLIPSETGZ} \
    && rm ${ECLIPSETGZ}; \
    ln -s ${ECLIPSEINSTDIR}/eclipse /usr/local/bin/eclipse
COPY resources/Eclipse.desktop /usr/share/applications/
COPY resources/dot_eclipse /root/.eclipse
RUN echo 'cp -r /root/.eclipse ${HOME}' >> /root/.novnc_setup

# Configuration of the file manager and the application launcher
COPY resources/dot_config/lxpanel/LXDE/panels/panel_2019 /root/.config/lxpanel/LXDE/panels/panel

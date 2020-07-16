FROM fredblgr/ubuntunovnc-3asem:2020

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

COPY resources/eclipse-modeling-2020-06-3asl.tgz /usr/local/
RUN cd /usr/local; tar zxf eclipse-modeling-2020-06-3asl.tgz && rm eclipse-modeling-2020-06-3asl.tgz
# Link the Java jdk from Isabelle 2020 for running Eclipse too
RUN ln -s /usr/local/eclipse-modeling-2020-06/eclipse /usr/local/bin/eclipse; \
    ln -s /usr/local/Isabelle2020/contrib/jdk-11.0.5+10/x86_64-linux/jre /usr/local/eclipse-modeling-2020-06/
COPY resources/Eclipse.desktop /usr/share/applications/
COPY resources/dot_eclipse /root/.eclipse
RUN echo 'cp -r /root/.eclipse ${HOME}' >> /root/.novnc_setup

# Configuration of the file manager and the application launcher
COPY resources/dot_config/lxpanel/LXDE/panels/panel /root/.config/lxpanel/LXDE/panels/
COPY resources/dot_config/pcmanfm/LXDE/pcmanfm.conf /root/.config/pcmanfm/LXDE/

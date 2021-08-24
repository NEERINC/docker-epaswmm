# syntax=docker/dockerfile:1.0

FROM ubuntu

ARG EPASWMM_VERSION
ENV EPASWMM_VERSION=${EPASWMM_VERSION}
ENV INP_FILE_URL=

WORKDIR /epaswmm

RUN apt update && apt install -y git gcc wget

RUN git clone https://github.com/NEERINC/EPASWMM . && git checkout v${EPASWMM_VERSION}

RUN sed -i -e 's/#define DLL/\/\/#define DLL/' ./src/swmm5.c && \
    sed -i -e 's/\/\/#define CLE/#define CLE/' ./src/swmm5.c

RUN cd src && \
    if [ "${EPASWMM_VERSION}" = "5.0.22" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.0.22 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.1" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.1 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.2" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.2 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.3" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.3 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.4" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.4 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.5" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.4 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.6" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.5 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.6" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.6 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.7" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.7 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.8" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.8 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.9" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.9 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.10" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.10 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.11" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.11 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.12" ]; then \
        gcc -Wall swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.12 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.13" ]; then \
        gcc -Wall main.c swmm5.c climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.13 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.14" ]; then \
        gcc -Wall climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c main.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c swmm5.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.14 -lm ; \
    elif [ "${EPASWMM_VERSION}" = "5.1.15" ]; then \
        gcc -Wall climate.c controls.c culvert.c datetime.c dwflow.c dynwave.c error.c exfil.c findroot.c flowrout.c forcmain.c gage.c gwater.c hash.c hotstart.c iface.c infil.c inflow.c input.c inputrpt.c keywords.c kinwave.c landuse.c lid.c lidproc.c link.c main.c massbal.c mathexpr.c mempool.c node.c odesolve.c output.c project.c qualrout.c rain.c rdii.c report.c roadway.c routing.c runoff.c shape.c snow.c stats.c statsrpt.c subcatch.c surfqual.c swmm5.c table.c toposort.c transect.c treatmnt.c xsect.c -o epaswmm5.1.15 -lm ; \
    fi

RUN mv ./src/epaswmm${EPASWMM_VERSION} .

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]

# Configuración de rutas de los ejecutables
set path = (/home/EDA/CDS/SYNOPSYS/installer $path)
set path = (/home/EDA/CDS/SYNOPSYS/scl/2024.06/linux64/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/vcs/U-2023.03-SP2-9/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/verdi/U-2023.03-SP2-9/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/lc/U-2022.12-SP6/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/syn/U-2022.12-SP7-3/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/icc2/U-2022.12-SP6/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/customcompiler/U-2023.03-6/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/prime/U-2022.12-SP5-5/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/hspice/U-2023.03-SP2-2/hspice/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/fm/U-2022.12-SP6/bin $path)
set path = (/home/EDA/CDS/SYNOPSYS/primepower/U-2023.03-SP2-2/bin $path)

# Variables de licencia con la IP correcta
setenv SNPSLMD_LICENSE_FILE 27020@192.168.118.26
setenv LM_LICENSE_FILE 27020@192.168.118.26
setenv CDS_Netlisting_Mode "Analog"
# Variables de VCS
setenv VCS_HOME /home/EDA/CDS/SYNOPSYS/vcs/U-2023.03-SP2-9/
setenv VCS_TARGET_ARCH linux64
setenv VCS_LIC_EXPIRE_WARNING 0

# Variables de Verdi
setenv VERDI_HOME /home/EDA/CDS/SYNOPSYS/verdi/U-2023.03-SP2-9/
setenv VERDI_LIB /home/EDA/CDS/SYNOPSYS/verdi/U-2023.03-SP2-9/share/PLI/VCS/LINUX64/

# Variables de Verdi Supplementary Package
setenv VERDI_SUPP_HOME /home/EDA/CDS/SYNOPSYS/verdi_supp/U-2023.03-SP2-9/
setenv PATH /home/EDA/CDS/SYNOPSYS/verdi_supp/U-2023.03-SP2-9/bin:$PATH

# Variables de Library Compiler (LC)
setenv SYNOPSYS_LC_ROOT /home/EDA/CDS/SYNOPSYS/lc/U-2022.12-SP6/
setenv LC_HOME /home/EDA/CDS/SYNOPSYS/lc/U-2022.12-SP6/
setenv PATH /home/EDA/CDS/SYNOPSYS/lc/U-2022.12-SP6/bin:$PATH

# Variables para Design Compiler (syn)
setenv SYN_HOME /home/EDA/CDS/SYNOPSYS/syn/U-2022.12-SP7-3/
setenv DC_HOME /home/EDA/CDS/SYNOPSYS/syn/U-2022.12-SP7-3/

# Variables para IC Compiler II (ICC2)
setenv ICC2_HOME /home/EDA/CDS/SYNOPSYS/icc2/U-2022.12-SP6/
setenv ICC2_BIN /home/EDA/CDS/SYNOPSYS/icc2/U-2022.12-SP6/bin
setenv ICC2_LIB /home/EDA/CDS/SYNOPSYS/icc2/U-2022.12-SP6/lib
setenv PATH /home/EDA/CDS/SYNOPSYS/icc2/U-2022.12-SP6/bin:$PATH

# Variables para Custom Compiler
setenv CUSTOMCOMPILER_HOME /home/EDA/CDS/SYNOPSYS/customcompiler/U-2023.03-6/
setenv CUSTOMCOMPILER_BIN /home/EDA/CDS/SYNOPSYS/customcompiler/U-2023.03-6/bin
setenv CUSTOMCOMPILER_LIB /home/EDA/CDS/SYNOPSYS/customcompiler/U-2023.03-6/lib


# Variables para PrimeWave
setenv PRIMEWAVE_HOME /home/EDA/CDS/SYNOPSYS/primewave/U-2023.03-3-T-20230515
setenv PATH /home/EDA/CDS/SYNOPSYS/primewave/U-2023.03-3-T-20230515/bin:$PATH





# Variables para PrimeTime
setenv PRIMETIME_HOME /home/EDA/CDS/SYNOPSYS/prime/U-2022.12-SP5-5/
setenv PATH /home/EDA/CDS/SYNOPSYS/prime/U-2022.12-SP5-5/bin:$PATH

# Variables para HSPICE
setenv HSPICE_HOME /home/EDA/CDS/SYNOPSYS/hspice/U-2023.03-SP2-2/
setenv PATH /home/EDA/CDS/SYNOPSYS/hspice/U-2023.03-SP2-2/bin:$PATH

# Variables para Formal Verification (FM)
setenv FM_HOME /home/EDA/CDS/SYNOPSYS/fm/U-2022.12-SP6/
setenv PATH /home/EDA/CDS/SYNOPSYS/fm/U-2022.12-SP6/bin:$PATH

# Variables para PrimePower
setenv PRIMEPOWER_HOME /home/EDA/CDS/SYNOPSYS/primepower/U-2023.03-SP2-2/
setenv PATH /home/EDA/CDS/SYNOPSYS/primepower/U-2023.03-SP2-2/bin:$PATH

# Variables de DGCOM (si es requerida en la instalación)
setenv SYNOPSYS_DGCOM_ROOT /home/EDA/CDS/SYNOPSYS/


# TSMC180

setenv SYNOPSYS_CUSTOM_INSTALL /home/EDA/CDS/SYNOPSYS/customcompiler/U-2023.03-6/auxx/
setenv TSMC180DIR /home/EDA/PDK/synopsys/TSMC180-1p6m_4X1U40KA-2fF
setenv TSMCIPLibraries /home/EDA/PDK/TSMC-IP-Libraries
setenv TSMC_MODELS $TSMC180DIR/models



echo "Entorno de Synopsys configurado"


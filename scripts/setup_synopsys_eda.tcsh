#!/bin/bash
# ======================================================================
# [Filename]    Bashrc
# [Description] Entorno Completo X-FAB XH018 + RefKit + Verificación
# [Author]      Alejandro Bautista; abautista@inaoep.mx
# ======================================================================

# 1. PREVENIR CARGA DOBLE
if [[ -n "${_SNPS_ENV_LOADED:-}" ]]; then
  echo " (info) Entorno ya cargado. Listo para trabajar."
  return 0 2>/dev/null || :
fi
export _SNPS_ENV_LOADED=1

# 2. CONFIGURACIÓN BÁSICA DE SHELL
shopt -s expand_aliases
umask 0022
export LANG=C.UTF-8
# Límite de memoria ilimitado para herramientas grandes como ICV/StarRC
ulimit -s unlimited || true

# ======================================================================
# 3. DEFINICIÓN DE HERRAMIENTAS SYNOPSYS 
# ======================================================================
export SNPS_HOME="/home/EDA/CDS/SYNOPSYS"

export CUSTOMCOMPILER_HOME="$SNPS_HOME/customcompiler/W-2024.09-3"
export PRIME_SIM_HOME="$SNPS_HOME/primesim/W-2024.09-SP2-2"
export HSPICE_HOME="$SNPS_HOME/hspice/W-2024.09-SP2-3/hspice"
export ICVALIDATOR_HOME="$SNPS_HOME/icvalidator/W-2024.09-SP5-5"
export STAR_RC_HOME="$SNPS_HOME/starrc/W-2024.09-SP5"
export SYN_HOME="$SNPS_HOME/syn/W-2024.09-SP5-2"
export ICC2_HOME="$SNPS_HOME/icc2/W-2024.09-SP3"
export VERDI_HOME="$SNPS_HOME/verdi/W-2024.09-SP2-3"
export PRIMEWAVE_HOME="$SNPS_HOME/primewave/W-2024.09-3"
export FM_HOME="$SNPS_HOME/fm/W-2024.09-SP5"
export LC_HOME="$SNPS_HOME/lc/W-2024.09-SP3"
export PRIME_HOME="$SNPS_HOME/prime/W-2024.09-SP5-1"
export PRIME_SIM_DI_HOME="$SNPS_HOME/primesim_di/W-2024.09-SP2-2"
export PRIME_SIM_DR_HOME="$SNPS_HOME/primesim_dr/W-2024.09-SP2-2"
export PRIME_SIM_EMIR_HOME="$SNPS_HOME/primesim_emir/W-2024.09-SP2-2"
export VCS_HOME="$SNPS_HOME/vcs/W-2024.09-SP2-3"
export VERDI_SUPP_HOME="$SNPS_HOME/verdi_supp/W-2024.09-SP2-3"
export FC_HOME="$SNPS_HOME/fusioncompiler/W-2024.09-SP3"
export MW_HOME="$SNPS_HOME/mw/W-2024.09-SP2"
export CCK_HOME="$SNPS_HOME/cck/W-2024.09-SP2-2"
# Variables "Legacy" (Necesarias porque los scripts de X-FAB son antiguos)
export SYNOPSYS_CUSTOM="$CUSTOMCOMPILER_HOME"
export SYNOPSYS_PRIME="$PRIME_SIM_HOME"
export SYNOPSYS_ICV="$ICVALIDATOR_HOME"


# ======================================================================
# 4. CONFIGURACIÓN DEL PDK y REFKIT 
# ======================================================================
# Raíz de la instalación
export PDK_ROOT_DIR="/home/EDA/PDK/SYNOPSYS_XFAB"

# ¡ESTA ES LA CLAVE! El RefKit busca sus librerías usando esta variable
export FTK_KIT_DIR="$PDK_ROOT_DIR"

# Rutas al Kernel del PDK (Versión v10.1)
export XH018_PDK_DIR="${PDK_ROOT_DIR}/xh018/synopsys/v10_1/PDK/CustomCompiler/v10_1_1"
export XFAB_PDK_DIR="$XH018_PDK_DIR"

# Configuración de PyCell Studio (Para que se dibujen los transistores)
export CNI_ROOT="$CUSTOMCOMPILER_HOME/linux64/pycell_studio"

# ======================================================================
# 5. VARIABLES DE AYUDA PARA VERIFICACIÓN (DRC/LVS/PEX)
# ======================================================================
# Ruta donde están los archivos .rs (Runsets)
export ICV_RUNSET_DIR="${PDK_ROOT_DIR}/xh018/synopsys/v10_1/ICValidator/v10_1_1_1"

# Archivo de mapeo para extracción StarRC (Stack 1131 Típico)
export STARRC_NXTGRD="${PDK_ROOT_DIR}/xh018/synopsys/v10_1/StarRC/v10_1_1/nxtgrd/xh018_1131_Typ.nxtgrd"

# ======================================================================
# 6. CONFIGURACIÓN DE SIMULACIÓN 
# ======================================================================
# Apunta al archivo setup del RefKit que mapea los modelos .lib/.sp
# Ajustado a la ruta v3_0_1 que vimos en tu 'tree'
export SYNOPSYS_SIM_SETUP="${PDK_ROOT_DIR}/x_all/synopsys/XFAB_AMS_RefKit-synopsys_CustomCompiler/v3_0_1/design/synopsys_sim.setup"

# ======================================================================
# 7. ACTUALIZACIÓN DEL SYSTEM PATH Y LICENCIAS
# ======================================================================
# Agregar binarios al PATH
export PATH="$CUSTOMCOMPILER_HOME/bin:$PRIME_SIM_HOME/bin:$HSPICE_HOME/bin:$ICVALIDATOR_HOME/bin:$STAR_RC_HOME/bin:$SYN_HOME/bin:$ICC2_HOME/bin:$VERDI_HOME/bin:$CNI_ROOT/bin:$PRIMEWAVE_HOME/bin:$FM_HOME/bin:$PRIME_HOME/bin:$PRIME_SIM_DI_HOME/bin:$PRIME_SIM_DR_HOME/bin:$PRIME_SIM_EMIR_HOME/bin:$VCS_HOME/bin:$VERDI_SUPP_HOME/bin:$FC_HOME/bin:$MW_HOME/bin:$CCK_HOME/bin:$PATH"

# Agregar librerías dinámicas
if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$CNI_ROOT/lib"
else
    export LD_LIBRARY_PATH="$CNI_ROOT/lib:$LD_LIBRARY_PATH"
fi

# Servidor de Licencias
export SNPSLMD_LICENSE_FILE="27020@192.168.118.26"
export LM_LICENSE_FILE="$SNPSLMD_LICENSE_FILE"

# ======================================================================
# 8. MENSAJE FINAL
# ======================================================================
echo "============================================================"
echo " ENTORNO XH018 (REFKIT) CARGADO EXITOSAMENTE"
echo "============================================================"
echo " "
echo " AVISO IMPORTANTE DE USO Y CONFIDENCIALIDAD"
echo " "
echo " El uso de las herramientas de SYNOPSYS y del PDK de X-FAB"
echo " cargados en este entorno está ESTRICTAMENTE LIMITADO a"
echo " actividades académicas y técnicas del Diplomado KUTSARI."
echo " "
echo " Cualquier uso fuera del alcance de dicho diplomado,"
echo " incluyendo pero no limitado a fines comerciales, externos,"
echo " institucionales no autorizados o personales, constituye una"
echo " violación a los acuerdos de licencia y confidencialidad."
echo " "
echo " Dicho uso no autorizado podrá ser sancionado conforme a la"
echo " legislación aplicable y a los términos contractuales"
echo " correspondientes, incluyendo responsabilidades de carácter"
echo " administrativo, civil y, en su caso, penal."
echo " "
echo " Para iniciar, ejecuta: cdesigner -loadAll true &"
echo "============================================================"

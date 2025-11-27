
echo "Running CMS GEN request script using cms-sw containers. Architecture: el9:x86_64"
python3 -m venv cms_gen_venv_wmLHEGEN && source ./cms_gen_venv_wmLHEGEN/bin/activate

# Install the PdmV REST client
pip install git+https://github.com/cms-PdmV/mcm_scripts &> /dev/null

echo "Packages installed"
pip freeze
echo ""

# GEN Script begin
rm -f request_fragment_check.py
wget -q https://gitlab.cern.ch/cms-gen/genproductions_scripts/-/raw/master/bin/utils/request_fragment_check.py
chmod +x request_fragment_check.py

./request_fragment_check.py --bypass_status --prepid wmLHEGEN

# End of CMS GEN script file: wmLHEGEN_gen_script.sh

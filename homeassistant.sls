# Packages needed for home assistant
{% set packages = ["python3", "python3-dev", "python3-venv", "python3-pip", "libffi-dev", "libssl-dev"] %}

# Install home assistant packages
homeassistant_packages:
  pkg.installed:
  - names: {{ packages }}

# Install home assistant 
homeassistant:
  pip.installed:
  - name: []
  - bin_env: /usr/bin/pip3

# Create the service for homeasssitant
homeassistant_create_service:
  file.managed:
    - name: /etc/systemd/system/homeassistant.service
    - source: salt://files/homeassistant.service

# Enable the service
homeassistant_service:
  service.running:
    - name: homeassistant
    - enable: True
  require:
    - file: /etc/systemd/system/homeassistant.service

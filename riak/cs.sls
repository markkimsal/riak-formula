{% set riak = salt['pillar.get']('riak', {}) %}
include:
  - riak

riak-cs:
  pkg:
    - installed
  require: 
    - pkg: riak

riak-cs-control:
  pkg:
    - installed
  require: 
    - pkg: riak-cs

{%if riak.get('install_stanchion') %}
stanchion: 
  pkg.installed:
    - order: last
{% endif %}

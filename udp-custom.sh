#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYt�R�  d_� }�����������P�P   ���z���   �0���9��F�#A��&&��2��M�4h�4�12bh0� 09��F�#A��&&��2� �D� ��ɠd���4��Cz4{$�S������J�߭��wi.l��Rwm�X�)�цNt����T}�����4���H�_m�c��غ�Df���F0@(�9�\Dv#��/�KDX�<��6�S�x�e�U�SR�K�WB�.\]��/�X{��:f��)J��J�]g��z_5��ґ�~[�vV�!F�I�iBJO����t���ơF\�7����e��7�$��V�L���g�hp��~�}�-O�#�����-o�I��l�J�m6W������o��+yX�v��J����T=ej��r��'3��Kn�s�]>G�l����7�>.���v
Q��p�۩��q}���<˕�����TiP�39�=̯3u���O�e��d[Q�W��Y{���*r:��HvxXq������4.��BI��4%$m-⚕�K��W��>KQB2���Dh�5)�1����_XיAJ�B���?���}K�H��09��W7�����U325���e(�?>�B���##Q�E/��T�n+fm~K�f�h��Y9��M9��/[Bri�Ģ(r>�ob����o�����X��l-oԭ�V��������"瑁(�7˴�ƜF����vH�1D��2F�\�dE
�l�S�Mb��0��n8�W
���2��8dhmt�g�p��\�"5��c���D�۵)!��/.Dea	��#"$r����S,ٕ�%�^��V�o�Y�z���sC�Ѕ�^%����ʥ�ɣо{ؔ�r��9�Tǒn��o�䋓3��GZ�e&�i7R�4cf�IRCRX�:OjE�k"�K%���l�"��j"��bE��ҋĤ��0�7�e,c2��iP�������?��t0����'�y�a��ܑN$(�@
# targetGenerator
> Utilidad para la kitty y la zsh, sirve para generar automáticamente "tabs" con sus nombres y directorios para organizar un espacio de trabajo de cara a realizar una máquina o auditoría.
----

### Requerimientos
- Kitty
- bspwn
- sxhkd
- zsh

### Instalación
> Debe primero activarse el control remoto de la kitty, en cada kitty debe iniciarse con esta configuración, para ello modificar `/home/<usuario>/.config/sxhkd/sxhkdrc` en la combinación para ejectar la kitty `super + return`

![image](https://github.com/SebSecRepos/targetGenerator/assets/130188315/8a8c33a7-54f8-40de-aebd-f3f421fdaf14)


> Una vez modificado el archivo `sxhkdrc` solo debemos ejecutar el `installer.sh` como root, esto genera el directorio en /opt/ y crea el enlace simbólico para ejecutar el script

##### En caso de querer utilizarse como root debe ejecutarse la kitty como root y con el control remoto habilitado

```bash
  sudo su
```

Crear la nueva ventana 
```bash
  /usr/bin/kitty -o allow_remote_control=yes & disown 
```

---

### Uso

```bash
  tarGen <ruta absoluta>
```
> Como vemos nos pide las direcciones ip sparadas por espacio de los equipos a auditar en la red, por cada una de las carpetas prinicipales, creará una con la ip de cada máquina.

![imagen](https://github.com/SebSecRepos/targetGenerator/assets/130188315/d92febae-16dd-4ac4-a88e-4e0dddeafc14)








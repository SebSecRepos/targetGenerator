# targetGenerator
> Utilidad para la kitty, sirve para generar automáticamente "tabs" con sus nombres y directorios para organizar un espacio de trabajo de cara a realizar una máquina o auditoría.
----

### Requerimientos
- Kitty
- bspwn
- sxhkd

### Instalación
> Debe primero activarse el control remoto de la kitty, en cada kitty debe iniciarse con esta configuración, para ello modificar `/home/<usuario>/.config/sxhkd/sxhkdrc`

![Captura de pantalla de 2023-10-01 15-01-19](https://github.com/SebSecRepos/targetGenerator/assets/130188315/68cdf994-b425-47c3-a38e-88fd6ca23a28)

> Una vez modificado el archivo `sxhkdrc` solo debemos ejecutar el `installer.sh` como root, esto genera el directorio en /opt/ y crea el enlace simbólico para ejecutar el script

##### En caso de querer utilizarse como root debe ejecutarse la kitty como root y con el control remoto habilitado

```bash
  sudo su
```

Crear la nueva ventana 
```bash
  /usr/bin/kitty -o allow_remote_control=yes -o enabled_layouts=tall & disown
```

---

### Uso

```bash
  tarGen <ruta absoluta>
```
![image](https://github.com/SebSecRepos/targetGenerator/assets/130188315/50e1aa75-bd02-4c61-858b-0d97551cabe6)

> Como vemos nos crea los directorios y las tabs de la kitty para cada directorio, cada tab ya esta establecida en su espacio de trabajo correspondiente

![image](https://github.com/SebSecRepos/targetGenerator/assets/130188315/05c3520d-c581-4348-9c8b-6d046d1aed94)






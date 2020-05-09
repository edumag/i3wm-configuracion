# Personalización i3wm

![I3Wm](/home/edumag/.config/i3/img/Screenshot-01.png)

## Instalación

```
# Instalamos dependencias.
sudo apt-get install i3 dunst compton tilix

# Bajamos configuración.
git clone git@gitlab.com:edumag/i3-configuraci-n.git
mv i3-configuraci-n.git $HOME/.config/i3

# Instalamos font awesome.
wget https://github.com/creationix/boxcode/raw/master/font/fontawesome-webfont.ttf
[[ -d "$HOME/.fonts" ]] || mkdir $HOME/.fonts
mv fontawesome-webfont.ttf $HOME/.fonts/

# Añadimos configuración propia a dunst
ln -s "$HOME/.config/i3/dunst" "$HOME/.config"



```



## Combinación de teclas básica

| Combinación      | Acción                                      |
| ---------------- | ------------------------------------------- |
| Mod+Enter        | Terminal                                    |
| Mod+Shift+Q      | Cerrar centana                              |
| Mod+d            | Lanzador aplicaciones                       |
| Mod+Shift+Space  | Cambiar ventana a modo flotante             |
| Mod+r            | Redimensionar ventana                       |
| Mod+Alt_L        | Seleccionar ventana                         |
| Mod+Shift+Flecha | Mover ventana de posición                   |
| Mod+w            | Cambio de disposición de ventanas (Layouts) |
| Mod+Flecha       | Cambiamos foco de ventana                   |



## font-awesome

[Font Awesome Free's Cheatsheet](https://fontawesome.com/cheatsheet?from=io)

Desde la web de fontawesome podemos copiar y pegar los iconos en nuestros
ficheros de configuración

## Rofi

Instalamos rofi como lanzador de aplicación
y de paso tenemos calculadora y selector de
ventanas.

### Menú de aplicaciones (Mod+d)

![Rofi1](/home/edumag/.config/i3/img/i3wm-02.png)

### Calculadora (Mod+c)

![Rofi2](/home/edumag/.config/i3/img/i3wm-03.png)

### Seleccionar ventana. (Mod+Tab_L)

![Rofi3](/home/edumag/.config/i3/img/i3wm-04.png)

## dunst (Notificaciones)

![Rofi3](/home/edumag/.config/i3/img/i3wm-05.png)

## pasystray (Volumen)

`sudo apt-get install pasystray lxappareance`

Al lanzar pasystray el icono oscuro no se ve bien.
Lanzamos lxappareance para cambiar el tema gtk y los iconos.

## Configuración de touchpad.

```
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
```
### Referencias

- https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/

## Referencias

- [Una buena explicación de como funciona](https://github.com/bookercodes/dotfiles.git)


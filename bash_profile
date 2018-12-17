echo "Custom bash profile loaded."

export EDITOR='vim'
export MYSQL_USERNAME=root
export MYSQL_PASSWORD=admin
export MYSQL_ROOT_PASSWORD=admin

# Output chmod reference diagram and usage
function chmod_ref {
  echo "
        OWNER  GROUP   WORLD
        r w x  r w x   r w x
        1 1 1  1 0 1   1 0 1
          7      5       5
          |______|_______|
                 |
                755
  "

  echo "
 000  001  010  011  100  101  110  111
  0    1    2    3    4    5    6    7
  "

  chmod --help
}

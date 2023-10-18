def grep_simplificado(cad_buscar, array_indicadores, files_to_search)
  # -n  nombre_archivo: numero de coincidencia
  if array_indicadores[0]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      puts nombre_del_archivo + " : "
      puts numero_de_coincidencia
    end
  end

  # -l  nombre de archivos que contiene al menos una linea de coincidencia
  if array_indicadores[1]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      if numero_de_coincidencia > 0
        puts nombre_del_archivo
      end
    end
  end

  # -i  numero de coincidencia (sin importar si es mayuscula o minuscula)
  if array_indicadores[2]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS (sin importar si es mayuscula o minuscula)
        end
      end
      puts numero_de_coincidencia
    end
  end

  # -v  numero de lineas que no coinciden
  if array_indicadores[3]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      numero_de_lineas = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          numero_de_lineas = numero_de_lineas + 1
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      puts numero_de_lineas - numero_de_coincidencia
    end
  end

  # -x  Busca solo líneas donde la cadena de búsqueda coincida con la línea completa
  if array_indicadores[4]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          if linea == cad_buscar
            numero_de_coincidencia = numero_de_coincidencia + 1
          end
        end
      end
      puts numero_de_coincidencia
    end
  end
end

V_indicadores = [true, false, false, false, false]
cadena = "ciclo 2023-2"
V_archivos = ['cursos.txt', 'deportes.txt']
grep_simplificado(cadena, V_indicadores, V_archivos)

# INDICADORES
# -n  nombre_archivo: numero de coincidencia
# -l  nombre de archivos que contiene al menos una linea de coincidencia
# -i  numero de coincidencia (sin importar si es mayuscula o minuscula)
# -v  numero de lineas que no coinciden
# -x  Busca solo líneas donde la cadena de búsqueda coincida con la línea completa

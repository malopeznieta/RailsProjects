class LibroController < ApplicationController
  
  def index
    puts "Aquí se supone que debemos devolver todos los libros"
  end
  
  def new
    puts "Aquí se supone que debemos crear el nuevo libro"
  end
  
  def edit
    id = params[:id]
    puts "Aquí debemos editar el libro con ID: #{id}"
  end
  
  def show
    id = params[:id]
    puts "Aquí debemos devolver el libro con ID: #{id}"
    @libro = Libro.new
    @libro.id = id
    @libro.titulo = "Cien años de soledad"
    @libro.autor = "Gabriel García Márquez"
    respond_to{
      |format| # format va a representar el formato que me ha metido el desarrollador
      format.json{
        # Si en la URL le llega .json se muestra el libro en formato json
        render :json => @libro.to_json
      }
      format.html{
        # Si en la URL le llega sin extensión se muestra el libro en formato html
        render :index
      }
    }
  end
  
  def metodo_prueba
    codigo = params[:codigo]
    @libro = Libro.new
    @libro.id = codigo
    @libro.titulo = "Don quijote de la Mancha"
    @libro.autor = "Miguel de Cervantes"
    render :index
  end
end

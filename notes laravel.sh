## Create api or new laravel app
- laravel new "api_project"

# *Excecute migrations to ensure that DB is configured*
- php artisan migrate

## *CHECK DATABASE CONNECTION*
> Create path route
    > Edita routes/web.php y agrega esta ruta temporal:

'''
use Illuminate\Support\Facades\DB;
Route::get('/test-db', function () {
    try {
        DB::connection()->getPdo();
        return "Conexión exitosa a la base de datos!";
    } catch (\Exception $e) {
        return "Error al conectar a la base de datos: " . $e->getMessage();
    }
});
'''

##  GET products
1. *Crear el Modelo y Migración*
- php artisan make:model Product -m
* Un modelo: app/Models/Product.php
* Una migración: database/migrations/xxxx_xx_xx_xxxxxx_create_products_table.php

2. *Definir la Tabla en la Migración*
* Edita database/migrations/xxxx_xx_xx_xxxxxx_create_products_table.php y define la estructura:

'''
public function up():
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('description');
            $table->double('price', 10, 2);
            $table->integer('stock');
            $table->timestamps();
        });
    }
'''

* Ejecutar migración
- php artisan migrate

3. *Definir el Modelo*
* Edita app/Models/Product.php y agrega:

'''
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['description', 'price', 'stock'];
}
'''

4. *Crear un Controlador*
- php artisan make:controller ProductController
* Abre app/Http/Controllers/ProductController.php y agrega:

'''
namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return response()->json(Product::all(), 200);
    }
}
'''

-------
**** If api.php doesnt exist then use
**** - php artisan install:api
-------

5. Definir la Ruta en api.php
* routes/api.php y agrega:

'''
use App\Http\Controllers\ProductController;
Route::get('/products', [ProductController::class, 'index']);
'''
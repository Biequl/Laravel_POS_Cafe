<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; // Import DB Facade
use Carbon\Carbon; // Import Carbon for date manipulation

class DashboardController extends Controller
{
    /**
     * Menampilkan halaman dashboard dengan data statistik.
     */
    public function index()
    {
        // Menghitung total dari masing-masing tabel
        $totalProducts = Product::count();
        $totalOrders = Order::count();
        $totalCategories = Category::count();
        $totalUsers = User::count();

        // --- DATA UNTUK GRAFIK PENJUALAN MINGGUAN ---
        
        // Menyiapkan array untuk 7 hari dalam seminggu
        $days = [];
        for ($i = 6; $i >= 0; $i--) {
            $days[Carbon::now()->subDays($i)->format('Y-m-d')] = 0;
        }

        // Mengambil data penjualan dari tabel order_items selama 7 hari terakhir
        $salesData = DB::table('order_items')
            ->join('orders', 'order_items.order_id', '=', 'orders.id')
            ->select(DB::raw('DATE(orders.created_at) as date'), DB::raw('SUM(order_items.quantity) as total_sales'))
            ->where('orders.created_at', '>=', Carbon::now()->subDays(6)->startOfDay())
            ->groupBy('date')
            ->orderBy('date', 'ASC')
            ->get();

        // Memasukkan data penjualan ke dalam array harian
        foreach ($salesData as $data) {
            if (isset($days[$data->date])) {
                $days[$data->date] = $data->total_sales;
            }
        }

        // Memisahkan label (tanggal) dan data (total penjualan) untuk chart
        $chartLabels = array_map(function($date) {
            return Carbon::parse($date)->format('D'); // Format menjadi 'Mon', 'Tue', dst.
        }, array_keys($days));
        
        $chartData = array_values($days);


        // Mengirimkan semua data ke view 'pages.dashboard'
        return view('pages.dashboard', compact(
            'totalProducts',
            'totalOrders',
            'totalCategories',
            'totalUsers',
            'chartLabels', // Data label untuk grafik
            'chartData'    // Data penjualan untuk grafik
        ));
    }
}

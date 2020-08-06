<?php
defined('BASEPATH') or exit('No direct script access allowed');

class StockOut extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(['item_m', 'stock_m']);
    }

    function index()
    {
        $data['stock'] = $this->stock_m->getOut()->result();
        $data['item'] = $this->item_m->get()->result();

        $this->template->load('templates/index', 'transaction/stock_out/index', $data);
    }

    function tambahOut()
    {
        $post = $this->input->post(null, TRUE);
        $this->stock_m->addOut($post);
        $this->item_m->update_stock_out($post);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                Stock_Out berhasil ditambah</div>');
        redirect('stockOut/index');
    }

    function hapusOut()
    {
        $id_stock = $this->uri->segment(3);
        $id_item = $this->uri->segment(4);
        $qty = $this->stock_m->getId($id_stock)->row()->qty;
        $data = ['qty' => $qty, 'id_item' => $id_item];

        $this->item_m->update_stock_in($data);
        $this->stock_m->del($id_stock);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
        Stock Out berhasil diHapus</div>');
        redirect('stockOut/index');
    }
}

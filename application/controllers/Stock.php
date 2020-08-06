<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stock extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(['item_m', 'supplier_m', 'stock_m']);
    }

    function index()
    {
        $data['stock'] = $this->stock_m->get()->result();
        $data['item'] = $this->item_m->get()->result();
        $data['supplier'] = $this->supplier_m->get()->result();

        $this->template->load('templates/index', 'transaction/stock_in/index', $data);
    }

    function tambahIn()
    {
        $post = $this->input->post(null, TRUE);
        $this->stock_m->add($post);
        $this->item_m->update_stock_in($post);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                Stock berhasil ditambah</div>');
        redirect('stock/index');
    }

    function hapusIn()
    {
        $id_stock = $this->uri->segment(3);
        $id_item = $this->uri->segment(4);
        $qty = $this->stock_m->getId($id_stock)->row()->qty;
        $data = ['qty' => $qty, 'id_item' => $id_item];

        $this->item_m->update_stock_out($data);
        $this->stock_m->del($id_stock);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
        Stock berhasil diHapus</div>');
        redirect('stock/index');
    }
}

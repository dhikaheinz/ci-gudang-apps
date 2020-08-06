<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Item extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(['item_m', 'category_m']);
    }


    public function index()
    {
        $data['title'] = 'item';
        $data['row']  = $this->item_m->get();
        $data['category'] = $this->category_m->get();


        $this->template->load('templates/index', 'product/item/index', $data);
    }

    public function tambah()
    {

        $this->db->insert(
            'p_item',
            [
                'barcode' => $this->input->post('barcode'),
                'name' => $this->input->post('name'),
                'category' => $this->input->post('category'),
                'price' => $this->input->post('price')
            ]
        );
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                Item berhasil ditambah</div>');
        redirect('Item/index');
    }

    function edit($id)
    {
        $query = $this->item_m->get($id);
        $data['edit_item'] = $query->row();
        $data['query_category'] = $this->category_m->get();

        $this->form_validation->set_rules('name', 'Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->template->load('templates/index', 'product/item/editItem', $data);
        } else {
            $this->item_m->editItem($id);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                    Edit Succes</div>');
            redirect('item/index');
        }
    }

    function hapus($id)
    {
        $this->db->where('id_item', $id);
        $this->db->delete('p_item');

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            item berhasil diHapus</div>');
        redirect('item/index');
    }
}

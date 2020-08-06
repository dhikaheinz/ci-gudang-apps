<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Supplier extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model('supplier_m');
    }


    public function index()
    {
        $data['row'] = $this->supplier_m->get();
        $this->template->load('templates/index', 'supplier/index', $data);
    }

    function tambah()
    {
        $this->db->insert(
            'supplier',
            [
                'name' => $this->input->post('name'),
                'phone' => $this->input->post('phone'),
                'address' => $this->input->post('address'),
                'description' => $this->input->post('description'),
            ]
        );
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                Supplier berhasil ditambah</div>');
        redirect('supplier/index');
    }

    function edit($id)
    {
        $data['edit_supplier'] = $this->supplier_m->getId($id);

        $this->form_validation->set_rules('name', 'Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->template->load('templates/index', 'supplier/editSupplier', $data);
        } else {
            $this->supplier_m->editSupplier($id);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
                    Edit Succes</div>');
            redirect('supplier/index');
        }
    }

    function hapus($id)
    {
        $this->supplier_m->hapus($id);
        $error = $this->db->error();
        if ($error['code'] != 0) {

            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
            Data supplier tidak dapat diHapus</div>');
            redirect('supplier/index');
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            Supplier berhasil diHapus</div>');
            redirect('supplier/index');
        }
    }
}

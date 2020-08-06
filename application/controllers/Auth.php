<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function index()
    {
        $this->load->view('auth/login');
    }
    function proses()
    {
        $post = $this->input->post(null, true);
        if (isset($post['login'])) {

            $this->load->model('auth_m');
            $query = $this->auth_m->login($post);

            if ($query->num_rows() > 0) {
                $row = $query->row();
                $params = [
                    'id'  => $row->id,
                    'level' => $row->level
                ];
                $this->session->set_userdata($params);
                echo "<script>
                    alert('Login Berhasil');
                </script>";
                redirect('Dashboard');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
                   Login Gagal!</div>');
                redirect('Auth');
            }
        }
    }
    function logout()
    {
        $params = ['id', 'level'];
        $this->session->unset_userdata($params);
        redirect('Auth');
    }
}

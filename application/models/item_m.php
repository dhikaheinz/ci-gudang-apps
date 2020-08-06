<?php
defined('BASEPATH') or exit('No direct script access allowed');

class item_m extends CI_Model
{
    public function get($id = null)
    {
        $this->db->select('p_item.*, p_category.name as category_name');
        $this->db->from('p_item');
        $this->db->join('p_category', 'p_category.id_category = p_item.category');
        if ($id != null) {
            $this->db->where('id_item', $id);
        }
        $query = $this->db->get();
        return $query;
    }
    function getId($id)
    {
        return $this->db->get_where('p_item', ['id_item' => $id])->row_array();
    }
    function editItem($id)
    {
        $data = [
            'barcode' => $this->input->post('barcode', true),
            'name' => $this->input->post('name', true),
            'category' => $this->input->post('category', true),
            'price' => $this->input->post('price', true),
            'updated' => date('Y-m-d H:i:s')
        ];

        $this->db->where('id_item', $id);
        $this->db->update('p_item', $data);
    }

    function update_stock_in($data)
    {
        $qty = $data['qty'];
        $id = $data['id_item'];
        $sql = "UPDATE p_item SET stock = stock + '$qty' WHERE id_item ='$id'";
        $this->db->query($sql);
    }

    function update_stock_out($data)
    {
        $qty = $data['qty'];
        $id = $data['id_item'];
        $sql = "UPDATE p_item SET stock = stock - '$qty' WHERE id_item ='$id'";
        $this->db->query($sql);
    }
}

<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Item</h1>
            </div>
            <!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Item</li>
                </ol>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">

        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
            <!-- Left col -->
            <section class="col-lg connectedSortable">
                <!-- Custom tabs (Charts with tabs)-->
                <div class="card">

                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="fas fa-chart-pie mr-1"></i>
                            Edit Item
                        </h3>
                        <div class="card-tools">
                            <ul class="nav nav-pills ml-auto">
                                <li class="nav-item">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content p-0">

                            <form class="col-md-5" method="post">
                                <?= $this->session->flashdata('message'); ?>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Id</label>
                                    <input type="text" class="form-control" id="id_item" value="<?= $edit_item->id_item ?>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Barcode</label>
                                    <input type="text" class="form-control" id="barcode" value="<?= $edit_item->barcode ?>" name="barcode" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Product Name</label>
                                    <input type="text" class="form-control" id="name" value="<?= $edit_item->name ?>" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Category</label>
                                    <select name="category" id="category" class="form-control">
                                        <option value="">Select Category</option>
                                        <?php foreach ($query_category->result() as $c) : ?>
                                            <option value="<?= $c->id_category ?>" <?= $c->id_category == $edit_item->category ? "selected" : null ?>><?= $c->name ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price</label>
                                    <input type="text" class="form-control" id="price" value="<?= $edit_item->price ?>" name="price" required>
                                </div>
                                <a href="<?= base_url('item'); ?>" class="btn btn-info">Kembali</a>
                                <button type="submit" name="edit" class="btn btn-primary">Edit</button>
                            </form>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
            </section>
            <!-- /.Left col -->
        </div>
        <!-- /.row (main row) -->
    </div>
    <!-- /.container-fluid -->
</section>
<!-- /.content -->
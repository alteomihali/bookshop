<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `clients` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>

<div class="card card-outline card-info">
    <div class="card-header">
        <h3 class="card-title"><?php echo isset($id) ? "Update ": "Create New " ?> Client</h3>
    </div>
    <div class="card-body">
        <form action="" id="user-form">
            <input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
            <div class="user-group">
                <label for="firstname" class="control-label">First Name</label>
                <textarea name="firstname" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($firstname) ? $firstname : ''; ?></textarea>
            </div>
            <div class="user-group">
                <label for="lastname" class="control-label">Last Name</label>
                <textarea name="lastname" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($lastname) ? $lastname : ''; ?></textarea>
            </div><br>
            <div class="user-group">
                <label for="gender" class="control-label">Gender</label>
                <select name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <div class="user-group">
                <label for="contact" class="control-label">Contact</label>
                <textarea name="contact" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($contact) ? $contact : ''; ?></textarea>
            </div>
            <div class="user-group">
                <label for="email" class="control-label">Email</label>
                <textarea name="email" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($email) ? $email : ''; ?></textarea>
            </div>
            <div class="form-group">
                <label for="password" class="control-label">Password</label>
                <textarea name="password" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($password) ? $password : ''; ?></textarea>
            </div>
            <div class="user-group">
                <label for="address" class="control-label">Default delivery address</label>
                <textarea name="address" id="" cols="20" rows="1" class="form-control form no-resize"><?php echo isset($address) ? $address : ''; ?></textarea>
            </div>
        </form>
    </div>
    <div class="card-footer">
        <button class="btn btn-flat btn-primary" form="user-form">Save</button>
        <a class="btn btn-flat btn-default" href="?page=maintenance/users">Cancel</a>
    </div>
</div>
<script>

    $(document).ready(function(){
        $('#user-form').submit(function(e){
            e.preventDefault();
            var _this = $(this)
            $('.err-msg').remove();
            start_loader();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=save_user",
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
                error:err=>{
                    console.log(err)
                    alert_toast("An error occurred",'error');
                    end_loader();
                },
                success:function(resp){
                    if(typeof resp =='object' && resp.status == 'success'){
                        location.href = "./?page=maintenance/users";
                    }else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                        el.addClass("alert alert-danger err-msg").text(resp.msg)
                        _this.prepend(el)
                        el.show('slow')
                        $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                        end_loader()
                    }else{
                        alert_toast("An error occurred",'error');
                        end_loader();
                        console.log(resp)
                    }
                }
            })
        })
    })
</script>
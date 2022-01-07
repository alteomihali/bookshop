<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Users</h3>
<!--		<div class="card-tools">-->
<!--			<a href="?page=maintenance/manage_users" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>-->
<!--		</div>-->
	</div>
	<div class="card-body">
		 <div class="container-fluid">
         <div class="container-fluid">
			 <table class="table table-bordered table-stripped">
				<thead>
					<tr>
					    <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Address</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $i = 1;
                    $qry = $conn->query("SELECT * from `clients` order by unix_timestamp(date_created) desc ");
                    while($row = $qry->fetch_assoc()):
                    $row['firstname'] = strip_tags(stripslashes(html_entity_decode($row['firstname'])));
                    ?>
                    	<tr>
                    	    <td class="text-center"><?php echo $i++; ?></td>
                    	    <td><?php echo $row['firstname'] ?></td>
                    	    <td><?php echo $row['lastname'] ?></td>
                    	    <td><?php echo $row['gender'] ?></td>
                    	    <td><?php echo $row['contact'] ?></td>
                    	    <td><?php echo $row['email'] ?></td>
                    	    <td><?php echo $row['password'] ?></td>
                    	    <td><?php echo $row['default_delivery_address'] ?></td>
                    		<td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                       			<td style="text-align:center">
                    				<button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                    					Action
                    				    <span class="sr-only">Toggle Dropdown</span>
                    				</button>
                    				<div class="dropdown-menu" role="menu">
<!--                                    	<a class="dropdown-item" href="?page=maintenance/manage_users&id=--><?php //echo $row['id'] ?><!--"><span class="fa fa-edit text-primary"></span> Edit</a>-->
                                    <div class="dropdown-divider"></div>
                                    	<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
                                    </div>
                    			</td>
                    		</tr>
                    			<?php endwhile; ?>
                   </tbody>
            </table>
        </div>
       </div>
    </div>
    </div>
                 <script>
                 $(document).ready(function(){
                 		$('.delete_data').click(function(){
                 			_conf("Are you sure to delete this user permanently?","delete_user",[$(this).attr('data-id')])
                 		})
                 		$('.table').dataTable();
                 	})
                 function delete_user($id){
                 		start_loader();
                 		$.ajax({
                 			url:_base_url_+"classes/Master.php?f=delete_user",
                 			method:"POST",
                 			data:{id: $id},
                 			dataType:"json",
                 			error:err=>{
                     				console.log(err)
                  				    alert_toast("An error occurred.",'error');
                      				end_loader();
                 			},
                 			success:function(resp){
                 				if(typeof resp== 'object' && resp.status == 'success'){
                 					location.reload();
                 				}else{
                 					alert_toast("An error occurred.",'error');
                 					end_loader();
                 				}
                 			}
                 		})
                 }
</script>

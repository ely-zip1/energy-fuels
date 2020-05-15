<div class="main-content">

	<section class="section">
		<div class="section-header section-header-custom">
			<h1>Make a Deposit</h1>
		</div>

		<div class="section-body">
      <div class="row ">
        <?php $this->load->view('templates/user_info'); ?>
      </div>

      <div class="row account-summary-row ">
        <div class="col-sm-4 account-summary-1">
          <div class="left">
            <img src="<?php echo base_url('assets/img/planactivebgside-min.png');?>" alt="">
            <div class="icon-container">
              <img src="<?php echo base_url('assets/img/plan1-min.png');?>" alt="">
            </div>
          </div>
          <div class="right">
            <div class="top">
              <h1>$80.00</h1>
							<h6>Up to $799.00</h6>
            </div>
            <div class="bottom1 plan-card">
							<h4><?php echo $plan1; ?></h4>
							<!-- <h4>ULTRAMAX PLAN</h4> -->
							<p class="plan-card-info">
								<b>120 Days</b> Contract
								<br>
								Sponsor Bonus
								<br>
								<b>1st level - 5%</b>
								<br>
								<b>2nd level - 3%</b>
								<br>
								<b>3rd level - 2%</b>
							</p>

							<h1 class="interest-info text-center"> 1% DAILY</h1>
            </div>
          </div>
        </div>

        <div class="col-sm-4 account-summary-1">
          <div class="left">
            <img src="<?php echo base_url('assets/img/planactivebgside-min.png');?>" alt="">
            <div class="icon-container">
              <img src="<?php echo base_url('assets/img/plan7-min.png');?>" alt="">
            </div>
          </div>
          <div class="right">
            <div class="top">
              <h1>$800.00</h1>
							<h6>Up to 3,999.00</h6>
            </div>
            <div class="bottom2 plan-card">
							<h4><?php echo $plan2; ?></h4>
							<p class="plan-card-info">
								<b>90 Days</b> Contract
								<br>
								Sponsor Bonus
								<br>
								<b>1st level - 5%</b>
								<br>
								<b>2nd level - 3%</b>
								<br>
								<b>3rd level - 2%</b>
							</p>

							<h1 class="interest-info text-center"> 1.5% DAILY</h1>
            </div>
          </div>
        </div>

        <div class="col-sm-4 account-summary-1">
          <div class="left">
            <img src="<?php echo base_url('assets/img/planactivebgside-min.png');?>" alt="">
            <div class="icon-container">
              <img src="<?php echo base_url('assets/img/plan9-min.png');?>" alt="">
            </div>
          </div>
          <div class="right">
            <div class="top">
              <h1>$4,000.00</h1>
							<h6>Up to 8,000.00</h6>
            </div>
            <div class="bottom3 plan-card">
							<h4><?php echo $plan3; ?></h4>
							<p class="plan-card-info">
								<b>60 Days</b> Contract
								<br>
								Sponsor Bonus
								<br>
								<b>1st level - 5%</b>
								<br>
								<b>2nd level - 3%</b>
								<br>
								<b>3rd level - 2%</b>
							</p>

							<h1 class="interest-info text-center"> 2% DAILY</h1>
            </div>
          </div>
        </div>
      </div>

			<div class="row deposit-row">
        <div class="col-12">
          <div class="alert bg-primary text-white">
          	<h4>Account Balance:  $ <?php echo $account_balance; ?></h4>
          </div>
        </div>
      </div>

			<div class="row row-deposit">
				<div class="col-md-1 text-center">
					<img src="<?php echo base_url('assets/img/calculatoricon-min.png'); ?>" alt="deposit">
				</div>

				<div class="col-md-9">
					<?php echo form_open('plans'); ?>
					<div class="form-row">
            <div class="form-group col-md-4 deposit-form">
							<label for="chosen_plan">Choose your Plan</label>
							<select class="form-control" name="chosen_plan">
								<option <?php if($selected_plan == 'plan1') {echo 'selected';} ?> value="plan1"><?php echo $plan1; ?></option>
								<option <?php if($selected_plan == 'plan2') {echo 'selected';} ?> value="plan2"><?php echo $plan2; ?></option>
								<option <?php if($selected_plan == 'plan3') {echo 'selected';} ?> value="plan3"><?php echo $plan3; ?></option>
							</select>
							<div class="invalid-feedback">
										<?php echo form_error('chosen_plan');?>
							</div>
            </div>

						<div class="form-group col-md-4 deposit-form">
							<label for="plan_option">Payment Mode</label>
							<select class="form-control" name="plan_payment_mode">
								<option <?php if($selected_mode == 'mode1') {echo 'selected';} ?> value="mode1">Bitcoin</option>
								<option <?php if($selected_mode == 'mode2') {echo 'selected';} ?> value="mode2">Abra</option>
								<option <?php if($selected_mode == 'mode3') {echo 'selected';} ?> value="mode3">Neteller</option>
								<option <?php if($selected_mode == 'mode4') {echo 'selected';} ?> value="mode4">Paypal</option>
								<option <?php if($selected_mode == 'mode5') {echo 'selected';} ?> value="mode5">Mastercard</option>
								<option <?php if($selected_mode == 'mode6') {echo 'selected';} ?> value="mode6">Skrill</option>
								<option <?php if($selected_mode == 'mode7') {echo 'selected';} ?> value="mode7">Reinvestment</option>
							</select>
							<div class="invalid-feedback">
										<?php echo form_error('plan_payment_mode');?>
							</div>
            </div>

            <div class="form-group col-md-4  deposit-form">
	            <label for="deposit_amount">Amount</label>
	            <input type="text" class="deposit-amount form-control <?php if(strlen(form_error('deposit_amount')) > 0){echo "is-invalid";} ?>"
								name="deposit_amount" id="deposit-amount" placeholder="Amount" value="<?php set_value('deposit_amount','',true); ?>">
							<div class="invalid-feedback deposit-error">
										<?php echo form_error('deposit_amount');?>
							</div>
            </div>
          </div>
				</div>

				<div class="col-md-2">
					<button type="submit" class="rounded-button submit-deposit" name="deposit-submit-button">SPEND</button>
					<?php echo form_close(); ?>
				</div>
			</div>

		<?php $this->load->view('pages/prefooter'); ?>

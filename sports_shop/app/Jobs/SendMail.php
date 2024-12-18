<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Mail\OrderShipped;
use Mail;

class SendMail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, SerializesModels;

    protected $email;
    protected $customer;
    protected $products;

    /**
     * Create a new job instance.
     */
    public function __construct($email, $customer, $products)
    {
        $this->email = $email;
        $this->customer = $customer;
        $this->products = $products;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        Mail::to($this->email)->send(new OrderShipped($this->customer, $this->products));
    }
}
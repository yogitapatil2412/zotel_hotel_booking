<div class="header-wrapper">
    <div class="app-header">

        <div class="container d-flex align-items-center justify-content-between ">

            @if(!empty($showSearch))
            <form method="POST" action="{{ route('search.rooms') }}" class="flex-grow-1 me-2">
                @csrf

                <div class="search-bar d-flex align-items-center justify-content-between">

                    <div class="d-flex flex-grow-1">


                        <div class="search-item date-box">
                            <small>CHECK-IN</small><br>
                            <input type="text" id="check_in" value="{{ $check_in_input }}"
                                min="{{ date('Y-m-d') }}" name="check_in" data-max="{{ $maxDate }}" data-default="{{ $check_in_input }}">
                        </div>

                        <div class="search-item date-box">
                            <small>CHECK-OUT</small><br>
                            <input type="text" id="check_out" value="{{ $check_out_input }}" name="check_out" data-max="{{ $maxDate }}" data-default="{{ $check_out_input }}">
                        </div>

                        <div class="search-item">
                            <small class="text-muted">ADULTS</small><br>

                            <div>
                                <i class="bi bi-dash-circle cursor" onclick="changeGuests(-1)"></i>
                                <span id="guestCount">{{ $guests }}</span>
                                <i class="bi bi-plus-circle cursor" onclick="changeGuests(1)"></i>
                            </div>

                            <input type="hidden" name="guests" id="guestInput" value="{{ $guests }}">
                        </div>
                    </div>

                    <button type="submit" class="btn search-btn">
                        <i class="bi bi-search"></i> Search
                    </button>

                </div>
            </form>
            @elseif(!empty($showBack))
            <a href="{{ url()->previous() }}" class="text-dark">
                <i class="bi bi-arrow-left fs-5"></i></a>

            @if(!empty($title))
            <h6 class="mb-0 fw-semibold">{{ $title }}</h6>
            @endif
            @endif


            <button class="btn ms-2" data-bs-toggle="offcanvas" data-bs-target="#sideMenu">
                <i class="bi bi-list fs-4"></i>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="sideMenu">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title">Zotel Demo Property</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>

                <div class="offcanvas-body">
                    <ul class="list-unstyled">
                        <li class="mb-3">
                            <a href="{{ route('search.index') }}" class="text-decoration-none text-dark">
                                <i class="bi bi-search me-2"></i> Booking
                            </a>
                        <li class="mb-3">
                            <a href="{{ route('config.index') }}" class="text-decoration-none text-dark">
                                <i class="bi bi-gear me-2"></i> Discounts
                            </a>
                        </li>
                        <li>
                            <a href="{{ route('inventory.index') }}" class="text-decoration-none text-dark">
                                <i class="bi bi-grid me-2"></i> Inventory
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { deleteBank, getbank } from "../../store/bank/bank.action";
import { warning } from "../../../util/Alert";
import Skeleton from "react-loading-skeleton";
import { colors } from "../../../util/SkeletonColor";
import dayjs from "dayjs";
import Button from "../../extra/Button";
import { OPEN_DIALOGUE } from "../../store/dialogue/dialogue.type";
import BankDialog from "./BankDialog";
import Table from "../../extra/Table";
import Pagination from "../../extra/Pagination";

const BankSetting = () => {
  const [page, setPage] = useState(0);
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  const [rowsPerPage, setRowsPerPage] = useState(10);

  const dispatch = useDispatch();

  const { bank } = useSelector((state) => state.bank);
  const { dialogue, dialogueType, dialogueData } = useSelector(
    (state) => state.dialogue
  );
  

  useEffect(() => {
    dispatch(getbank());
  }, [dispatch]);

  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(false);
    }, 1500); // Adjust the delay time as needed

    return () => clearTimeout(timer);
  }, []);

  useEffect(() => {
    setData(bank);
  }, [bank]);

  // // pagination
  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event, 10));
    setPage(0);
  };

  const handleClick = (bankDetail) => {
    
    // props.enabledDisabled(
    //   bankDetail,
    //   bankDetail?.isEnabled === true ? false : true
    // );
  };

  // Delete bank
  const handleDelete = (id) => {
    

    const data = warning("Delete");
    data
      .then((isDeleted) => {
        if (isDeleted) {
          dispatch(deleteBank(id));
        }
      })
      .catch((err) => console.log(err));
  };

  const mapData = [
    {
      Header: "No",
      width: "20px",
      Cell: ({ index }) => <span>{parseInt(index) + 1}</span>,
    },

    {
      Header: "Bank Name",
      body: "name",
      Cell: ({ row }) => <span>{row?.name}</span>,
    },

    {
      Header: "CreatedDate",
      body: "createdAt",
      Cell: ({ row }) => (
        <span>{dayjs(row.createdAt).format("DD MMM YYYY")}</span>
      ),
    },
    {
      Header: "Edit",
      body: "",
      Cell: ({ row }) => (
        <>
          <Button
            newClass={`themeFont boxCenter userBtn fs-5`}
            btnIcon={`far fa-edit`}
            style={{
              borderRadius: "5px",
              margin: "auto",
              width: "40px",
              backgroundColor: "#fff",
              color: "#160d98",
            }}
            onClick={() =>
              dispatch({
                type: OPEN_DIALOGUE,
                payload: { data: row, type: "bank" },
              })
            }
          />
          {dialogue && dialogueType === "bank" && <BankDialog />}
        </>
      ),
    },
    {
      Header: "Delete",
      body: "",
      Cell: ({ row }) => (
        <>
          <button
            className={`themeBtn text-center `}
            style={{
              borderRadius: "5px",
              margin: "auto",
              width: "40px",
              backgroundColor: "#fff",
              color: "#cd2c2c",
            }}
            onClick={() => handleDelete(row?._id)}
          >
            <svg
              width="25"
              height="25"
              viewBox="0 0 20 20"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M4.04017 6L4.9258 16.6912C4.98927 17.4622 5.646 18.0667 6.41993 18.0667H14.5801C15.354 18.0667 16.0108 17.4622 16.0742 16.6912L16.9598 6H4.04017ZM7.99953 16.0667C7.7378 16.0667 7.5176 15.8631 7.501 15.5979L7.001 7.53123C6.9839 7.25537 7.19337 7.01807 7.46877 7.00097C7.7544 6.98093 7.98147 7.19287 7.99903 7.46873L8.49903 15.5354C8.51673 15.8211 8.2907 16.0667 7.99953 16.0667ZM11 15.5667C11 15.843 10.7764 16.0667 10.5 16.0667C10.2236 16.0667 10 15.843 10 15.5667V7.5C10 7.22363 10.2236 7 10.5 7C10.7764 7 11 7.22363 11 7.5V15.5667ZM13.999 7.53127L13.499 15.5979C13.4826 15.8604 13.2638 16.0791 12.9687 16.0657C12.6933 16.0486 12.4839 15.8113 12.501 15.5354L13.001 7.46877C13.0181 7.1929 13.2598 6.9922 13.5312 7.001C13.8066 7.0181 14.0161 7.2554 13.999 7.53127ZM17 3H14V2.5C14 1.67287 13.3271 1 12.5 1H8.5C7.67287 1 7 1.67287 7 2.5V3H4C3.4477 3 3 3.4477 3 4C3 4.55223 3.4477 5 4 5H17C17.5523 5 18 4.55223 18 4C18 3.4477 17.5523 3 17 3ZM13 3H8V2.5C8 2.22413 8.22413 2 8.5 2H12.5C12.7759 2 13 2.22413 13 2.5V3Z"
                fill="#CD2C2C"
              />
            </svg>
          </button>
        </>
      ),
    },

    // add more columns as needed
  ];
  return (
    <>
      <div className="mainSellerTable">
        <div className="sellerTable">
          <div className="sellerHeader primeHeader">
            <div className="row">
              <div className="col-10">
                <Button
                  newClass={`whiteFont`}
                  btnColor={`btnBlackPrime`}
                  btnIcon={`fa-solid fa-plus`}
                  btnName={`Add`}
                  onClick={() => {
                    dispatch({
                      type: OPEN_DIALOGUE,
                      payload: { type: "bank" },
                    });
                  }}
                  style={{ borderRadius: "10px" }}
                />
                {dialogue && dialogueType === "bank" && <BankDialog />}
              </div>
              <div className="col-2 text-end"></div>
            </div>
          </div>
          <div className="sellerMain">
            <div className="tableMain mt-2">
              <Table
                data={data}
                mapData={mapData}
                PerPage={rowsPerPage}
                Page={page}
                type={"client"}
              />
              <Pagination
                component="div"
                count={bank?.length}
                serverPage={page}
                type={"client"}
                onPageChange={handleChangePage}
                serverPerPage={rowsPerPage}
                totalData={bank?.length}
                onRowsPerPageChange={handleChangeRowsPerPage}
              />
            </div>
          </div>
          <div className="sellerFooter primeFooter"></div>
        </div>
      </div>
    </>
  );
};

export default BankSetting;
